.class public Lz1/c2;
.super Ljava/lang/Object;
.source "LoaderTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/c2$a;
    }
.end annotation


# instance fields
.field private A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/I;",
            ">;>;"
        }
    .end annotation
.end field

.field private B:Z

.field private final C:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/L1;",
            ">;"
        }
    .end annotation
.end field

.field private D:Z

.field private E:Ljava/lang/String;

.field private F:Z

.field private G:Z

.field private H:I

.field private I:Z

.field private J:Z

.field private K:Z

.field L:Lcom/android/launcher3/util/x0;

.field private M:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Landroid/content/Context;

.field private final h:Lcom/android/launcher3/D3;

.field private final i:Lcom/android/launcher3/F1;

.field private final j:Z

.field private final k:Lz1/m;

.field protected final l:Lz1/y0;

.field private final m:Lz1/y1$a;

.field private final n:Lz1/m2;

.field private o:Z

.field private p:Lz1/R0;

.field private final q:Lz1/O;

.field private final r:Landroid/content/pm/LauncherApps;

.field private final s:Landroid/os/UserManager;

.field private final t:LD1/t;

.field private final u:Lcom/android/launcher3/util/J1;

.field private final v:LD1/b;

.field private final w:Ls1/P;

.field private final x:Lz1/L4;

.field private y:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private z:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/L1;",
            "Landroid/content/pm/PackageInstaller$SessionInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;LD1/t;Lcom/android/launcher3/util/J1;LD1/b;Ls1/P;Lz1/m;Lz1/y0;Lz1/y1$a;ZLz1/O;Lz1/L4;)V
    .locals 3

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
    iput-object v0, p0, Lz1/c2;->A:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lz1/c2;->C:Ljava/util/Set;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lz1/c2;->D:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lz1/c2;->F:Z

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    iput v1, p0, Lz1/c2;->H:I

    .line 25
    .line 26
    iput-boolean v0, p0, Lz1/c2;->I:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lz1/c2;->J:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lz1/c2;->K:Z

    .line 31
    .line 32
    new-instance v2, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Lz1/c2;->M:Ljava/util/HashMap;

    .line 38
    .line 39
    iput-object p1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 40
    .line 41
    iput-object p2, p0, Lz1/c2;->i:Lcom/android/launcher3/F1;

    .line 42
    .line 43
    iput-object p3, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 44
    .line 45
    iput-boolean p11, p0, Lz1/c2;->j:Z

    .line 46
    .line 47
    iput-object p8, p0, Lz1/c2;->k:Lz1/m;

    .line 48
    .line 49
    iput-object p9, p0, Lz1/c2;->l:Lz1/y0;

    .line 50
    .line 51
    invoke-virtual {p3}, Lcom/android/launcher3/D3;->n0()Lz1/m2;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iput-object p2, p0, Lz1/c2;->n:Lz1/m2;

    .line 56
    .line 57
    iput-object p12, p0, Lz1/c2;->q:Lz1/O;

    .line 58
    .line 59
    iput-object p10, p0, Lz1/c2;->m:Lz1/y1$a;

    .line 60
    .line 61
    const-class p2, Landroid/content/pm/LauncherApps;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    check-cast p2, Landroid/content/pm/LauncherApps;

    .line 68
    .line 69
    iput-object p2, p0, Lz1/c2;->r:Landroid/content/pm/LauncherApps;

    .line 70
    .line 71
    const-class p2, Landroid/os/UserManager;

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Landroid/os/UserManager;

    .line 78
    .line 79
    iput-object p2, p0, Lz1/c2;->s:Landroid/os/UserManager;

    .line 80
    .line 81
    iput-object p4, p0, Lz1/c2;->t:LD1/t;

    .line 82
    .line 83
    iput-object p5, p0, Lz1/c2;->u:Lcom/android/launcher3/util/J1;

    .line 84
    .line 85
    iput-object p6, p0, Lz1/c2;->v:LD1/b;

    .line 86
    .line 87
    iput-object p7, p0, Lz1/c2;->w:Ls1/P;

    .line 88
    .line 89
    move-object/from16 p2, p13

    .line 90
    .line 91
    iput-object p2, p0, Lz1/c2;->x:Lz1/L4;

    .line 92
    .line 93
    const/4 p2, 0x0

    .line 94
    iput-object p2, p0, Lz1/c2;->z:Ljava/util/HashMap;

    .line 95
    .line 96
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    const-string p3, "need_show_empty_icon"

    .line 101
    .line 102
    invoke-interface {p2, p3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iput p2, p0, Lz1/c2;->H:I

    .line 107
    .line 108
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    const-string p3, "restore_resize_layout"

    .line 113
    .line 114
    invoke-interface {p2, p3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eq p2, v1, :cond_0

    .line 119
    .line 120
    const/4 v0, 0x1

    .line 121
    :cond_0
    iput-boolean v0, p0, Lz1/c2;->G:Z

    .line 122
    .line 123
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-virtual {p2}, Lcom/android/launcher3/b0;->l()Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-nez p2, :cond_1

    .line 140
    .line 141
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iget-boolean p0, p0, Lz1/c2;->G:Z

    .line 154
    .line 155
    invoke-virtual {p1, p0}, Lcom/android/launcher3/b0;->t(Z)V

    .line 156
    .line 157
    .line 158
    :cond_1
    return-void
.end method

.method private C()Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/d;",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->i0:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lx1/O;->n1()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    new-instance v0, Landroid/content/ComponentName;

    .line 55
    .line 56
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-class v3, Lcom/android/launcher3/settings/ConcernModeActivity;

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Landroid/content/Intent;

    .line 80
    .line 81
    const-string v3, "android.intent.action.MAIN"

    .line 82
    .line 83
    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 84
    .line 85
    .line 86
    const-string v3, "android.intent.category.LAUNCHER"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 111
    .line 112
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    if-eqz v0, :cond_0

    .line 121
    .line 122
    new-instance v1, Lcom/android/launcher3/model/data/d;

    .line 123
    .line 124
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 125
    .line 126
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-direct {v1, p0, v0, v2}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 139
    .line 140
    .line 141
    new-instance p0, Landroid/util/Pair;

    .line 142
    .line 143
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    return-object p0

    .line 147
    :cond_0
    return-object v1
.end method

.method private D()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/d;",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;>;"
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
    iget-object v1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/android/launcher3/r4;->h()Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroid/content/ComponentName;

    .line 47
    .line 48
    iget-object v3, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 49
    .line 50
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->G0()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    iget-object v3, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 65
    .line 66
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->N0()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-nez v3, :cond_0

    .line 79
    .line 80
    invoke-static {}, Lx1/O;->n1()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-nez v3, :cond_0

    .line 85
    .line 86
    invoke-direct {p0, v2}, Lz1/c2;->v(Landroid/content/ComponentName;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-nez v3, :cond_0

    .line 91
    .line 92
    new-instance v3, Landroid/content/Intent;

    .line 93
    .line 94
    const-string v4, "android.intent.action.MAIN"

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 98
    .line 99
    .line 100
    const-string v4, "android.intent.category.DEFAULT"

    .line 101
    .line 102
    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 109
    .line 110
    const-class v4, Landroid/content/pm/LauncherApps;

    .line 111
    .line 112
    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Landroid/content/pm/LauncherApps;

    .line 117
    .line 118
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    if-eqz v2, :cond_0

    .line 127
    .line 128
    new-instance v3, Lcom/android/launcher3/model/data/d;

    .line 129
    .line 130
    iget-object v4, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 131
    .line 132
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-direct {v3, v4, v2, v5}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 137
    .line 138
    .line 139
    new-instance v4, Landroid/util/Pair;

    .line 140
    .line 141
    invoke-direct {v4, v3, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_1
    return-object v0
.end method

.method private E()Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/d;",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k0:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-static {}, Lx1/O;->n1()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    new-instance v0, Landroid/content/ComponentName;

    .line 39
    .line 40
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-class v3, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;

    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Landroid/content/Intent;

    .line 56
    .line 57
    const-string v3, "android.intent.action.MAIN"

    .line 58
    .line 59
    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 60
    .line 61
    .line 62
    const-string v3, "android.intent.category.LAUNCHER"

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 71
    .line 72
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 79
    .line 80
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-eqz v0, :cond_0

    .line 89
    .line 90
    iget-object v1, p0, Lz1/c2;->x:Lz1/L4;

    .line 91
    .line 92
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v1, v2}, Lz1/L4;->d(Landroid/os/UserHandle;)Z

    .line 97
    .line 98
    .line 99
    new-instance v1, Lcom/android/launcher3/model/data/d;

    .line 100
    .line 101
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-direct {v1, p0, v0, v2}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 108
    .line 109
    .line 110
    new-instance p0, Landroid/util/Pair;

    .line 111
    .line 112
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_0
    return-object v1
.end method

.method private F()Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/d;",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->a0:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lx1/O;->n1()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    new-instance v0, Landroid/content/ComponentName;

    .line 55
    .line 56
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-class v3, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;

    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Landroid/content/Intent;

    .line 72
    .line 73
    const-string v3, "android.intent.action.MAIN"

    .line 74
    .line 75
    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 76
    .line 77
    .line 78
    const-string v3, "android.intent.category.LAUNCHER"

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 87
    .line 88
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 89
    .line 90
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 95
    .line 96
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    if-eqz v0, :cond_0

    .line 105
    .line 106
    new-instance v1, Lcom/android/launcher3/model/data/d;

    .line 107
    .line 108
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 109
    .line 110
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-direct {v1, p0, v0, v2}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 115
    .line 116
    .line 117
    new-instance p0, Landroid/util/Pair;

    .line 118
    .line 119
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    return-object p0

    .line 123
    :cond_0
    return-object v1
.end method

.method private I()Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/d;",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->j0:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lx1/O;->n1()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    new-instance v0, Landroid/content/ComponentName;

    .line 55
    .line 56
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-class v3, Lcom/android/launcher3/settings/StandardModeActivity;

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Landroid/content/Intent;

    .line 80
    .line 81
    const-string v3, "android.intent.action.MAIN"

    .line 82
    .line 83
    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 84
    .line 85
    .line 86
    const-string v3, "android.intent.category.LAUNCHER"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 111
    .line 112
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    if-eqz v0, :cond_0

    .line 121
    .line 122
    new-instance v1, Lcom/android/launcher3/model/data/d;

    .line 123
    .line 124
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 125
    .line 126
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-direct {v1, p0, v0, v2}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 139
    .line 140
    .line 141
    new-instance p0, Landroid/util/Pair;

    .line 142
    .line 143
    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    return-object p0

    .line 147
    :cond_0
    return-object v1
.end method

.method public static K(Landroid/appwidget/AppWidgetProviderInfo;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private synthetic L(Ljava/util/List;Ljava/util/List;Landroid/util/Pair;)V
    .locals 4

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v2, Lcom/android/launcher3/model/data/q;

    .line 12
    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 14
    .line 15
    check-cast v1, Landroid/content/pm/LauncherActivityInfo;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {v2, v0, v1, v3}, Lcom/android/launcher3/model/data/q;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Z)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lz1/c2;->k:Lz1/m;

    .line 25
    .line 26
    iget-object p1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 29
    .line 30
    iget-object v0, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Landroid/content/pm/LauncherActivityInfo;

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0, v3}, Lz1/m;->d(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Landroid/content/pm/LauncherActivityInfo;

    .line 40
    .line 41
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private synthetic M(Lcom/android/launcher3/model/data/q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/c2;->k:Lz1/m;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lz1/m;->B(Lcom/android/launcher3/model/data/d;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic N()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/c2;->k:Lz1/m;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/util/J1;->g(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1, p0}, Lz1/m;->u(IZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic O(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    check-cast p2, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/folder/K;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/android/launcher3/folder/K;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, p0, v1, v0}, Lcom/android/launcher3/folder/FolderNameProvider;->j(Landroid/content/Context;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p2, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 18
    .line 19
    return-void
.end method

.method private synthetic P(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/android/launcher3/model/data/l;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/l;->y()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/folder/Folder;->H0:Ljava/util/Comparator;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lz1/c2;->w:Ls1/P;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Lcom/android/launcher3/model/data/l;->G(Ls1/P;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic Q(Lt1/n;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 2
    .line 3
    iget-object v0, v0, Lz1/y0;->d:Lz1/u5;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lz1/u5;->v(Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "load widgets finished"

    .line 11
    .line 12
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 19
    .line 20
    invoke-virtual {v1}, Lz1/O;->G()V

    .line 21
    .line 22
    .line 23
    const-string v1, "bindWidgets finished"

    .line 24
    .line 25
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {}, Lcom/android/launcher3/y0;->Y()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    sget-object v2, Lcom/android/launcher3/J3;->o:Lcom/android/launcher3/X;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_0

    .line 56
    .line 57
    iget-object v3, p0, Lz1/c2;->q:Lz1/O;

    .line 58
    .line 59
    invoke-virtual {v3}, Lz1/O;->E()V

    .line 60
    .line 61
    .line 62
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    filled-new-array {v2}, [Lh4/l;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v1, v2}, Lcom/android/launcher3/J3;->u([Lh4/l;)V

    .line 73
    .line 74
    .line 75
    const-string v1, "bindSmartspaceWidget finished"

    .line 76
    .line 77
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->Y()Z

    .line 85
    .line 86
    .line 87
    :goto_0
    const-string v1, "saving all widgets in icon cache"

    .line 88
    .line 89
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    sget-object v1, Lt1/i;->a:Lt1/i;

    .line 93
    .line 94
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 95
    .line 96
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    new-instance v3, Lz1/X1;

    .line 100
    .line 101
    invoke-direct {v3, v2}, Lz1/X1;-><init>(Lcom/android/launcher3/D3;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, v0, v1, v3}, Lt1/n;->k(Ljava/util/List;Lt1/j;Lt1/n$b;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p0}, Lz1/c2;->X()V

    .line 108
    .line 109
    .line 110
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Lt1/n;->g()V

    .line 114
    .line 115
    .line 116
    const-string p0, "finish icon update"

    .line 117
    .line 118
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :catch_0
    const-string p0, "LoaderTask"

    .line 123
    .line 124
    const-string p1, "fourth or fifth Cancelled"

    .line 125
    .line 126
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method private synthetic R()V
    .locals 2

    .line 1
    const-string v0, "LoaderTask"

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 4
    .line 5
    .line 6
    const-string v1, "sanitizeData run"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lz1/k2;->b0()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 21
    .line 22
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lz1/y0;->w(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    const-string p0, "sanitizeData Cancelled"

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic S(Lcom/android/launcher3/resource/h1$h;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "verifyPrivateApps addPrivateApp appInfo: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "LoaderTask"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p1, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 40
    .line 41
    iget v2, p1, Lcom/android/launcher3/resource/h1$h;->b:I

    .line 42
    .line 43
    invoke-static {v2}, Lcom/android/launcher3/resource/h1;->a0(I)Landroid/os/UserHandle;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v1, v2}, Lz1/Q2;->onPackageRemoved(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object v0, p1, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 57
    .line 58
    iget p1, p1, Lcom/android/launcher3/resource/h1$h;->b:I

    .line 59
    .line 60
    invoke-static {p1}, Lcom/android/launcher3/resource/h1;->a0(I)Landroid/os/UserHandle;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, v0, p1}, Lz1/Q2;->onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method private synthetic T(Ljava/util/ArrayList;Lcom/android/launcher3/resource/h1$h;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p2, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    iget-object v1, p2, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget v1, p2, Lcom/android/launcher3/resource/h1$h;->b:I

    .line 40
    .line 41
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-ne v1, v0, :cond_0

    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v0, "verifyPrivateApps addPrivateApp appInfo: "

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v0, "LoaderTask"

    .line 72
    .line 73
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v0, p2, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 83
    .line 84
    iget v1, p2, Lcom/android/launcher3/resource/h1$h;->b:I

    .line 85
    .line 86
    invoke-static {v1}, Lcom/android/launcher3/resource/h1;->a0(I)Landroid/os/UserHandle;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v0, v1}, Lz1/Q2;->onPackageRemoved(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iget-object p1, p2, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 100
    .line 101
    iget p2, p2, Lcom/android/launcher3/resource/h1$h;->b:I

    .line 102
    .line 103
    invoke-static {p2}, Lcom/android/launcher3/resource/h1;->a0(I)Landroid/os/UserHandle;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p0, p1, p2}, Lz1/Q2;->onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method private U()Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lz1/c2;->t:LD1/t;

    .line 4
    .line 5
    invoke-virtual {v1}, LD1/t;->p()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v3, v0, Lz1/c2;->k:Lz1/m;

    .line 15
    .line 16
    invoke-virtual {v3}, Lz1/m;->h()V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v4, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v5, v0, Lz1/c2;->l:Lz1/y0;

    .line 30
    .line 31
    monitor-enter v5

    .line 32
    :try_start_0
    iget-object v6, v0, Lz1/c2;->M:Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v6, 0x0

    .line 43
    const/4 v7, 0x0

    .line 44
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v8

    .line 48
    const/4 v9, 0x0

    .line 49
    if-eqz v8, :cond_c

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    check-cast v8, Landroid/os/UserHandle;

    .line 56
    .line 57
    iget-object v11, v0, Lz1/c2;->r:Landroid/content/pm/LauncherApps;

    .line 58
    .line 59
    invoke-virtual {v11, v9, v8}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    if-eqz v9, :cond_0

    .line 64
    .line 65
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v11

    .line 69
    if-eqz v11, :cond_1

    .line 70
    .line 71
    :cond_0
    move-object/from16 v18, v1

    .line 72
    .line 73
    goto/16 :goto_7

    .line 74
    .line 75
    :cond_1
    iget-object v11, v0, Lz1/c2;->x:Lz1/L4;

    .line 76
    .line 77
    invoke-virtual {v11, v8}, Lz1/L4;->d(Landroid/os/UserHandle;)Z

    .line 78
    .line 79
    .line 80
    move-result v17

    .line 81
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 82
    .line 83
    .line 84
    move-result v11

    .line 85
    if-eqz v11, :cond_3

    .line 86
    .line 87
    iget-object v11, v0, Lz1/c2;->t:LD1/t;

    .line 88
    .line 89
    invoke-virtual {v11, v8}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 90
    .line 91
    .line 92
    move-result-object v11

    .line 93
    invoke-virtual {v11}, Lcom/android/launcher3/util/N2;->e()Z

    .line 94
    .line 95
    .line 96
    move-result v11

    .line 97
    if-eqz v11, :cond_2

    .line 98
    .line 99
    move/from16 v6, v17

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    iget-object v11, v0, Lz1/c2;->t:LD1/t;

    .line 103
    .line 104
    invoke-virtual {v11, v8}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 105
    .line 106
    .line 107
    move-result-object v11

    .line 108
    invoke-virtual {v11}, Lcom/android/launcher3/util/N2;->d()Z

    .line 109
    .line 110
    .line 111
    move-result v11

    .line 112
    if-eqz v11, :cond_3

    .line 113
    .line 114
    move/from16 v7, v17

    .line 115
    .line 116
    :cond_3
    :goto_1
    new-instance v11, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    new-instance v12, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    const/4 v13, 0x0

    .line 127
    :goto_2
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 128
    .line 129
    .line 130
    move-result v14

    .line 131
    if-ge v13, v14, :cond_b

    .line 132
    .line 133
    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v14

    .line 137
    check-cast v14, Landroid/content/pm/LauncherActivityInfo;

    .line 138
    .line 139
    move-object v15, v12

    .line 140
    new-instance v12, Lcom/android/launcher3/model/data/d;

    .line 141
    .line 142
    iget-object v5, v0, Lz1/c2;->t:LD1/t;

    .line 143
    .line 144
    invoke-virtual {v5, v8}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    sget-object v10, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 149
    .line 150
    move-object/from16 v18, v1

    .line 151
    .line 152
    iget-object v1, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 153
    .line 154
    invoke-virtual {v10, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    check-cast v1, Lcom/android/launcher3/util/f;

    .line 159
    .line 160
    iget-object v10, v0, Lz1/c2;->u:Lcom/android/launcher3/util/J1;

    .line 161
    .line 162
    move-object/from16 v16, v15

    .line 163
    .line 164
    move-object v15, v1

    .line 165
    move-object/from16 v1, v16

    .line 166
    .line 167
    move-object/from16 v16, v14

    .line 168
    .line 169
    move-object v14, v5

    .line 170
    move v5, v13

    .line 171
    move-object/from16 v13, v16

    .line 172
    .line 173
    move-object/from16 v16, v10

    .line 174
    .line 175
    invoke-direct/range {v12 .. v17}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;Z)V

    .line 176
    .line 177
    .line 178
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 179
    .line 180
    .line 181
    move-result v10

    .line 182
    if-eqz v10, :cond_5

    .line 183
    .line 184
    invoke-virtual {v13}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 185
    .line 186
    .line 187
    move-result-object v10

    .line 188
    iget-boolean v10, v10, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    .line 189
    .line 190
    if-eqz v10, :cond_5

    .line 191
    .line 192
    invoke-virtual {v13}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 193
    .line 194
    .line 195
    move-result-object v10

    .line 196
    iget-object v10, v10, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v14, v0, Lz1/c2;->z:Ljava/util/HashMap;

    .line 199
    .line 200
    if-eqz v14, :cond_4

    .line 201
    .line 202
    new-instance v15, Lcom/android/launcher3/util/L1;

    .line 203
    .line 204
    invoke-direct {v15, v10, v8}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v14, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v10

    .line 211
    check-cast v10, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_4
    iget-object v14, v0, Lz1/c2;->v:LD1/b;

    .line 215
    .line 216
    invoke-virtual {v14, v8, v10}, LD1/b;->a(Landroid/os/UserHandle;Ljava/lang/String;)Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 217
    .line 218
    .line 219
    move-result-object v10

    .line 220
    :goto_3
    if-eqz v10, :cond_5

    .line 221
    .line 222
    iget v14, v12, Lcom/android/launcher3/model/data/z;->h:I

    .line 223
    .line 224
    or-int/lit16 v14, v14, 0x400

    .line 225
    .line 226
    iput v14, v12, Lcom/android/launcher3/model/data/z;->h:I

    .line 227
    .line 228
    invoke-virtual {v10}, Landroid/content/pm/PackageInstaller$SessionInfo;->getProgress()F

    .line 229
    .line 230
    .line 231
    move-result v10

    .line 232
    const/high16 v14, 0x42c80000    # 100.0f

    .line 233
    .line 234
    mul-float/2addr v10, v14

    .line 235
    float-to-int v10, v10

    .line 236
    const/4 v14, 0x1

    .line 237
    invoke-virtual {v12, v10, v14}, Lcom/android/launcher3/model/data/z;->J(II)V

    .line 238
    .line 239
    .line 240
    :cond_5
    iget-object v10, v12, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 241
    .line 242
    iget-object v14, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 243
    .line 244
    invoke-static {v10, v8, v14}, Lx1/O;->n2(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)Z

    .line 245
    .line 246
    .line 247
    move-result v10

    .line 248
    if-eqz v10, :cond_6

    .line 249
    .line 250
    const-string v10, "cmKey: "

    .line 251
    .line 252
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    iget-object v10, v12, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 256
    .line 257
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v10, "#"

    .line 261
    .line 262
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    const-string v10, "\n"

    .line 269
    .line 270
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const/4 v14, 0x1

    .line 274
    goto/16 :goto_5

    .line 275
    .line 276
    :cond_6
    iget-object v10, v0, Lz1/c2;->A:Ljava/util/List;

    .line 277
    .line 278
    iget-boolean v14, v0, Lz1/c2;->o:Z

    .line 279
    .line 280
    invoke-virtual {v0, v12, v13, v10, v14}, Lz1/c2;->A(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;Ljava/util/List;Z)Lcom/android/launcher3/model/data/q;

    .line 281
    .line 282
    .line 283
    move-result-object v10

    .line 284
    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    iget-object v10, v0, Lz1/c2;->k:Lz1/m;

    .line 288
    .line 289
    const/4 v14, 0x0

    .line 290
    invoke-virtual {v10, v12, v13, v14}, Lz1/m;->d(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;Z)V

    .line 291
    .line 292
    .line 293
    iget-object v10, v12, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 294
    .line 295
    invoke-virtual {v10}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v10

    .line 299
    invoke-virtual {v4, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v13

    .line 303
    if-eqz v13, :cond_7

    .line 304
    .line 305
    invoke-virtual {v4, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v13

    .line 309
    check-cast v13, Landroid/os/UserHandle;

    .line 310
    .line 311
    iget-object v14, v12, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 312
    .line 313
    invoke-virtual {v13, v14}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    move-result v13

    .line 317
    if-eqz v13, :cond_7

    .line 318
    .line 319
    const/4 v14, 0x1

    .line 320
    iput-boolean v14, v12, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 321
    .line 322
    goto :goto_4

    .line 323
    :cond_7
    const/4 v14, 0x1

    .line 324
    iget-object v13, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 325
    .line 326
    iget-object v15, v12, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 327
    .line 328
    invoke-static {v13, v10, v15}, Lcom/android/launcher3/util/D1;->f(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 329
    .line 330
    .line 331
    move-result v10

    .line 332
    if-eqz v10, :cond_8

    .line 333
    .line 334
    iput-boolean v14, v12, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 335
    .line 336
    new-instance v10, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 339
    .line 340
    .line 341
    const-string v13, "packageName: "

    .line 342
    .line 343
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    iget-object v13, v12, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 347
    .line 348
    invoke-virtual {v13}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v13

    .line 352
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v13, " isNewApp: true \n"

    .line 356
    .line 357
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v10

    .line 364
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    :cond_8
    :goto_4
    iget-object v10, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 368
    .line 369
    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 370
    .line 371
    .line 372
    move-result-object v10

    .line 373
    invoke-virtual {v10}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 374
    .line 375
    .line 376
    move-result-object v10

    .line 377
    iget-object v13, v12, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 378
    .line 379
    invoke-virtual {v13}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v13

    .line 383
    invoke-virtual {v10, v13}, Lcom/android/launcher3/H5;->w0(Ljava/lang/String;)Z

    .line 384
    .line 385
    .line 386
    move-result v10

    .line 387
    const/4 v14, 0x1

    .line 388
    if-eqz v10, :cond_9

    .line 389
    .line 390
    iput-boolean v14, v12, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 391
    .line 392
    :cond_9
    iget-object v10, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 393
    .line 394
    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 395
    .line 396
    .line 397
    move-result-object v10

    .line 398
    invoke-virtual {v10}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 399
    .line 400
    .line 401
    move-result-object v10

    .line 402
    iget-object v13, v12, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 403
    .line 404
    invoke-virtual {v13}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v13

    .line 408
    invoke-virtual {v10, v13}, Lcom/android/launcher3/D3;->r0(Ljava/lang/String;)Z

    .line 409
    .line 410
    .line 411
    move-result v10

    .line 412
    if-eqz v10, :cond_a

    .line 413
    .line 414
    iput-boolean v14, v12, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 415
    .line 416
    :cond_a
    :goto_5
    add-int/lit8 v13, v5, 0x1

    .line 417
    .line 418
    move-object v12, v1

    .line 419
    move-object/from16 v1, v18

    .line 420
    .line 421
    goto/16 :goto_2

    .line 422
    .line 423
    :cond_b
    move-object/from16 v18, v1

    .line 424
    .line 425
    move-object v1, v12

    .line 426
    const-string v5, "LoaderTask"

    .line 427
    .line 428
    new-instance v8, Ljava/lang/StringBuilder;

    .line 429
    .line 430
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 431
    .line 432
    .line 433
    const-string v10, "loadAllApps hiddenAppStr:"

    .line 434
    .line 435
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v10

    .line 442
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v8

    .line 449
    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    .line 451
    .line 452
    const-string v5, "LoaderTask"

    .line 453
    .line 454
    new-instance v8, Ljava/lang/StringBuilder;

    .line 455
    .line 456
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 457
    .line 458
    .line 459
    const-string v10, "loadAllApps newAppStr:"

    .line 460
    .line 461
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v1

    .line 468
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 476
    .line 477
    .line 478
    invoke-interface {v2, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 479
    .line 480
    .line 481
    :goto_6
    move-object/from16 v1, v18

    .line 482
    .line 483
    goto/16 :goto_0

    .line 484
    .line 485
    :goto_7
    const-string v1, "LoaderTask"

    .line 486
    .line 487
    const-string v5, "loadAllApps this user apps is null"

    .line 488
    .line 489
    invoke-static {v1, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    .line 491
    .line 492
    goto :goto_6

    .line 493
    :cond_c
    const/4 v14, 0x1

    .line 494
    new-instance v1, Ljava/util/ArrayList;

    .line 495
    .line 496
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .line 498
    .line 499
    invoke-direct {v0}, Lz1/c2;->F()Landroid/util/Pair;

    .line 500
    .line 501
    .line 502
    move-result-object v4

    .line 503
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 504
    .line 505
    .line 506
    invoke-direct {v0}, Lz1/c2;->D()Ljava/util/ArrayList;

    .line 507
    .line 508
    .line 509
    move-result-object v4

    .line 510
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 511
    .line 512
    .line 513
    invoke-direct {v0}, Lz1/c2;->C()Landroid/util/Pair;

    .line 514
    .line 515
    .line 516
    move-result-object v4

    .line 517
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    invoke-direct {v0}, Lz1/c2;->I()Landroid/util/Pair;

    .line 521
    .line 522
    .line 523
    move-result-object v4

    .line 524
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 525
    .line 526
    .line 527
    invoke-direct {v0}, Lz1/c2;->E()Landroid/util/Pair;

    .line 528
    .line 529
    .line 530
    move-result-object v4

    .line 531
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    new-instance v4, Lz1/a2;

    .line 535
    .line 536
    invoke-direct {v4, v0, v3, v2}, Lz1/a2;-><init>(Lz1/c2;Ljava/util/List;Ljava/util/List;)V

    .line 537
    .line 538
    .line 539
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 540
    .line 541
    .line 542
    sget-object v1, Lf1/a;->i:Lf1/a$a;

    .line 543
    .line 544
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 545
    .line 546
    .line 547
    move-result v1

    .line 548
    if-eqz v1, :cond_e

    .line 549
    .line 550
    iget-object v1, v0, Lz1/c2;->v:LD1/b;

    .line 551
    .line 552
    invoke-virtual {v1}, LD1/b;->c()Ljava/util/List;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 557
    .line 558
    .line 559
    move-result-object v1

    .line 560
    :cond_d
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 561
    .line 562
    .line 563
    move-result v4

    .line 564
    if-eqz v4, :cond_e

    .line 565
    .line 566
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 567
    .line 568
    .line 569
    move-result-object v4

    .line 570
    check-cast v4, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 571
    .line 572
    iget-object v5, v0, Lz1/c2;->k:Lz1/m;

    .line 573
    .line 574
    iget-object v8, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 575
    .line 576
    invoke-static {v4}, LD1/f;->b(Landroid/content/pm/PackageInstaller$SessionInfo;)LD1/f;

    .line 577
    .line 578
    .line 579
    move-result-object v4

    .line 580
    const/4 v10, 0x0

    .line 581
    invoke-virtual {v5, v8, v4, v10}, Lz1/m;->g(Landroid/content/Context;LD1/f;Z)Lcom/android/launcher3/model/data/d;

    .line 582
    .line 583
    .line 584
    move-result-object v4

    .line 585
    if-eqz v4, :cond_d

    .line 586
    .line 587
    new-instance v5, Lcom/android/launcher3/model/data/q;

    .line 588
    .line 589
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 590
    .line 591
    .line 592
    move-result-object v8

    .line 593
    invoke-virtual {v8}, Lt1/g;->e()Z

    .line 594
    .line 595
    .line 596
    move-result v8

    .line 597
    invoke-direct {v5, v4, v9, v8}, Lcom/android/launcher3/model/data/q;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Z)V

    .line 598
    .line 599
    .line 600
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 601
    .line 602
    .line 603
    goto :goto_8

    .line 604
    :cond_e
    const-string v1, "LoadAllAppsIconsInBulk"

    .line 605
    .line 606
    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    :try_start_1
    iget-object v1, v0, Lz1/c2;->w:Ls1/P;

    .line 610
    .line 611
    invoke-virtual {v1, v3}, Ls1/P;->K0(Ljava/util/List;)V

    .line 612
    .line 613
    .line 614
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    .line 615
    .line 616
    .line 617
    move-result v1

    .line 618
    if-eqz v1, :cond_10

    .line 619
    .line 620
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 621
    .line 622
    .line 623
    move-result-object v1

    .line 624
    :cond_f
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 625
    .line 626
    .line 627
    move-result v4

    .line 628
    if-eqz v4, :cond_10

    .line 629
    .line 630
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v4

    .line 634
    check-cast v4, Lcom/android/launcher3/model/data/q;

    .line 635
    .line 636
    iget-object v5, v4, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 637
    .line 638
    check-cast v5, Lcom/android/launcher3/model/data/d;

    .line 639
    .line 640
    iget-object v8, v0, Lz1/c2;->w:Ls1/P;

    .line 641
    .line 642
    iget-object v9, v5, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 643
    .line 644
    iget-object v10, v5, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 645
    .line 646
    invoke-virtual {v8, v9, v10}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 647
    .line 648
    .line 649
    move-result v8

    .line 650
    if-eqz v8, :cond_f

    .line 651
    .line 652
    new-instance v8, Ljava/lang/StringBuilder;

    .line 653
    .line 654
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 655
    .line 656
    .line 657
    const-string v9, "LoadAllAppsIconsInBulk: default icon found for "

    .line 658
    .line 659
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 663
    .line 664
    .line 665
    move-result-object v5

    .line 666
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 667
    .line 668
    .line 669
    const-string v5, ", will attempt to load from iconBlob: "

    .line 670
    .line 671
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 672
    .line 673
    .line 674
    iget-object v5, v4, Lcom/android/launcher3/model/data/q;->c:[B

    .line 675
    .line 676
    invoke-static {v5}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object v5

    .line 680
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 681
    .line 682
    .line 683
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 684
    .line 685
    .line 686
    move-result-object v5

    .line 687
    invoke-static {v5}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 688
    .line 689
    .line 690
    iget-object v5, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 691
    .line 692
    invoke-virtual {v4, v5}, Lcom/android/launcher3/model/data/q;->a(Landroid/content/Context;)Z

    .line 693
    .line 694
    .line 695
    goto :goto_9

    .line 696
    :cond_10
    new-instance v1, Lz1/b2;

    .line 697
    .line 698
    invoke-direct {v1, v0}, Lz1/b2;-><init>(Lz1/c2;)V

    .line 699
    .line 700
    .line 701
    invoke-interface {v3, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 702
    .line 703
    .line 704
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 705
    .line 706
    .line 707
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 708
    .line 709
    .line 710
    move-result v1

    .line 711
    if-eqz v1, :cond_11

    .line 712
    .line 713
    iget-object v1, v0, Lz1/c2;->k:Lz1/m;

    .line 714
    .line 715
    const/16 v3, 0x8

    .line 716
    .line 717
    invoke-virtual {v1, v3, v6}, Lz1/m;->u(IZ)V

    .line 718
    .line 719
    .line 720
    iget-object v1, v0, Lz1/c2;->k:Lz1/m;

    .line 721
    .line 722
    const/16 v3, 0x10

    .line 723
    .line 724
    invoke-virtual {v1, v3, v7}, Lz1/m;->u(IZ)V

    .line 725
    .line 726
    .line 727
    goto :goto_a

    .line 728
    :cond_11
    iget-object v1, v0, Lz1/c2;->k:Lz1/m;

    .line 729
    .line 730
    iget-object v3, v0, Lz1/c2;->x:Lz1/L4;

    .line 731
    .line 732
    invoke-virtual {v3}, Lz1/L4;->b()Z

    .line 733
    .line 734
    .line 735
    move-result v3

    .line 736
    const/4 v4, 0x2

    .line 737
    invoke-virtual {v1, v4, v3}, Lz1/m;->u(IZ)V

    .line 738
    .line 739
    .line 740
    :goto_a
    iget-object v1, v0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 741
    .line 742
    new-instance v3, Lx1/x;

    .line 743
    .line 744
    new-instance v4, Lz1/D1;

    .line 745
    .line 746
    invoke-direct {v4, v0}, Lz1/D1;-><init>(Lz1/c2;)V

    .line 747
    .line 748
    .line 749
    const/4 v10, 0x0

    .line 750
    invoke-direct {v3, v4, v10}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 751
    .line 752
    .line 753
    invoke-virtual {v1, v3}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 754
    .line 755
    .line 756
    iget-object v1, v0, Lz1/c2;->k:Lz1/m;

    .line 757
    .line 758
    iget-object v3, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 759
    .line 760
    const-string v4, "android.permission.MODIFY_QUIET_MODE"

    .line 761
    .line 762
    invoke-virtual {v3, v4}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 763
    .line 764
    .line 765
    move-result v3

    .line 766
    if-nez v3, :cond_12

    .line 767
    .line 768
    move v5, v14

    .line 769
    goto :goto_b

    .line 770
    :cond_12
    move v5, v10

    .line 771
    :goto_b
    const/4 v3, 0x4

    .line 772
    invoke-virtual {v1, v3, v5}, Lz1/m;->u(IZ)V

    .line 773
    .line 774
    .line 775
    iget-object v0, v0, Lz1/c2;->k:Lz1/m;

    .line 776
    .line 777
    invoke-virtual {v0}, Lz1/m;->o()Z

    .line 778
    .line 779
    .line 780
    return-object v2

    .line 781
    :catchall_0
    move-exception v0

    .line 782
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 783
    .line 784
    .line 785
    throw v0

    .line 786
    :catchall_1
    move-exception v0

    .line 787
    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 788
    throw v0
.end method

.method private V(Ljava/util/List;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Lz1/B1;",
            "Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;",
            ")V"
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
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v2, p0, Lz1/c2;->q:Lz1/O;

    .line 10
    .line 11
    iget-object v2, v2, Lz1/O;->e:Lz1/y0;

    .line 12
    .line 13
    iget v3, v2, Lz1/y0;->f:I

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    add-int/2addr v3, v4

    .line 17
    iput v3, v2, Lz1/y0;->f:I

    .line 18
    .line 19
    iget-object v3, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->l0()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    iput v3, v2, Lz1/y0;->g:I

    .line 26
    .line 27
    iget-object v2, p0, Lz1/c2;->q:Lz1/O;

    .line 28
    .line 29
    iget-object v3, v2, Lz1/O;->e:Lz1/y0;

    .line 30
    .line 31
    iget v3, v3, Lz1/y0;->f:I

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Lz1/O;->Y(I)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 37
    .line 38
    iget-object v2, v2, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 39
    .line 40
    new-instance v3, Lz1/C;

    .line 41
    .line 42
    invoke-direct {v3, v0}, Lz1/C;-><init>(Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v2, v3}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 46
    .line 47
    .line 48
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 49
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 50
    .line 51
    invoke-virtual {v1}, Lz1/O;->K()V

    .line 52
    .line 53
    .line 54
    move-object/from16 v10, p4

    .line 55
    .line 56
    invoke-direct {p0, v10}, Lz1/c2;->g0(Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 60
    .line 61
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    new-instance v2, Lz1/Y1;

    .line 65
    .line 66
    invoke-direct {v2, v1}, Lz1/Y1;-><init>(Lz1/O;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 70
    .line 71
    .line 72
    invoke-direct {p0}, Lz1/c2;->Y()Lcom/android/launcher3/util/z0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/util/x0;->A()[I

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v2}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Lz1/O;->J(Lcom/android/launcher3/util/x0;)V

    .line 91
    .line 92
    .line 93
    const-string v1, "LoaderTask"

    .line 94
    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v3, "loadAndBindWorkspaceOptimize 1.0 workspaceScreens size: "

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->size()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v2, "(container = -101 AND (options&8=0)) OR (container IN (SELECT _id FROM "

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    sget-object v2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v2, " WHERE "

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v2, "itemType"

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v2, " = "

    .line 145
    .line 146
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const/4 v2, 0x2

    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v3, " AND "

    .line 154
    .line 155
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v3, "container"

    .line 159
    .line 160
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v3, " = "

    .line 164
    .line 165
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const/16 v3, -0x65

    .line 169
    .line 170
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v3, " AND ("

    .line 174
    .line 175
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v3, "options"

    .line 179
    .line 180
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v3, "&"

    .line 184
    .line 185
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const/16 v3, 0x8

    .line 189
    .line 190
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v5, "=0)))"

    .line 194
    .line 195
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v7

    .line 202
    move-object v5, p0

    .line 203
    move-object/from16 v6, p1

    .line 204
    .line 205
    move-object/from16 v8, p2

    .line 206
    .line 207
    move-object/from16 v9, p3

    .line 208
    .line 209
    invoke-direct/range {v5 .. v10}, Lz1/c2;->Z(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 210
    .line 211
    .line 212
    new-instance v1, Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .line 216
    .line 217
    iget-object v6, p0, Lz1/c2;->l:Lz1/y0;

    .line 218
    .line 219
    monitor-enter v6

    .line 220
    :try_start_1
    iget-object v7, p0, Lz1/c2;->l:Lz1/y0;

    .line 221
    .line 222
    invoke-static {v7}, Lp1/f;->b(Lz1/y0;)Ljava/util/List;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 227
    .line 228
    .line 229
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    sget-object v6, Lf1/a;->x:Lf1/a$a;

    .line 231
    .line 232
    invoke-virtual {v6}, Lf1/a$a;->c()Z

    .line 233
    .line 234
    .line 235
    move-result v6

    .line 236
    if-eqz v6, :cond_0

    .line 237
    .line 238
    iget-object v6, p0, Lz1/c2;->q:Lz1/O;

    .line 239
    .line 240
    invoke-static {v1}, Lp1/f;->e(Ljava/util/List;)I

    .line 241
    .line 242
    .line 243
    move-result v7

    .line 244
    invoke-virtual {v6, v7}, Lz1/O;->W(I)V

    .line 245
    .line 246
    .line 247
    :cond_0
    iget-object v6, p0, Lz1/c2;->q:Lz1/O;

    .line 248
    .line 249
    iget-object v7, v6, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 250
    .line 251
    invoke-virtual {v6, v1, v7}, Lz1/O;->I(Ljava/util/ArrayList;Ljava/util/concurrent/Executor;)V

    .line 252
    .line 253
    .line 254
    iget-object v6, p0, Lz1/c2;->q:Lz1/O;

    .line 255
    .line 256
    iget-object v7, v6, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 257
    .line 258
    invoke-virtual {v6, v7}, Lz1/O;->N(Ljava/util/concurrent/Executor;)V

    .line 259
    .line 260
    .line 261
    const-string v6, "LoaderTask"

    .line 262
    .line 263
    new-instance v7, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .line 267
    .line 268
    const-string v8, "loadAndBindWorkspaceOptimize 2.0 hotseatItems size: "

    .line 269
    .line 270
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    .line 286
    .line 287
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 288
    .line 289
    invoke-virtual {v1}, Lz1/O;->P()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    const-string v6, "LoaderTask"

    .line 294
    .line 295
    new-instance v7, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 298
    .line 299
    .line 300
    const-string v8, "loadAndBindWorkspaceOptimize currentPageIndex is "

    .line 301
    .line 302
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v7

    .line 312
    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    .line 314
    .line 315
    const/4 v11, 0x0

    .line 316
    if-ltz v1, :cond_1

    .line 317
    .line 318
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->size()I

    .line 319
    .line 320
    .line 321
    move-result v6

    .line 322
    if-lt v1, v6, :cond_2

    .line 323
    .line 324
    :cond_1
    move v1, v11

    .line 325
    :cond_2
    invoke-direct {p0, v0, v1}, Lz1/c2;->k0(Lcom/android/launcher3/util/z0;I)Lcom/android/launcher3/util/x0;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, p0, Lz1/c2;->L:Lcom/android/launcher3/util/x0;

    .line 330
    .line 331
    invoke-virtual {v1}, Lcom/android/launcher3/util/x0;->A()[I

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    array-length v12, v1

    .line 336
    move v13, v11

    .line 337
    :goto_0
    if-ge v13, v12, :cond_5

    .line 338
    .line 339
    aget v14, v1, v13

    .line 340
    .line 341
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 342
    .line 343
    .line 344
    new-instance v6, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 347
    .line 348
    .line 349
    const-string v7, "(screen = "

    .line 350
    .line 351
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    const-string v7, " AND "

    .line 358
    .line 359
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    const-string v7, "container"

    .line 363
    .line 364
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v7, " = "

    .line 368
    .line 369
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    const/16 v7, -0x64

    .line 373
    .line 374
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    const-string v8, " AND ("

    .line 378
    .line 379
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    const-string v8, "options"

    .line 383
    .line 384
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v8, "&"

    .line 388
    .line 389
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    const-string v8, "=0  )) OR ("

    .line 396
    .line 397
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    const-string v8, "container"

    .line 401
    .line 402
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    const-string v8, " IN (SELECT "

    .line 406
    .line 407
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    const-string v8, "_id"

    .line 411
    .line 412
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    const-string v8, " FROM "

    .line 416
    .line 417
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    sget-object v8, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    const-string v8, " WHERE "

    .line 426
    .line 427
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    const-string v8, "itemType"

    .line 431
    .line 432
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    const-string v8, " = "

    .line 436
    .line 437
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    const-string v8, " AND "

    .line 444
    .line 445
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    const-string v8, "screen"

    .line 449
    .line 450
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 451
    .line 452
    .line 453
    const-string v8, " = "

    .line 454
    .line 455
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    const-string v8, " AND "

    .line 462
    .line 463
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    const-string v8, "container"

    .line 467
    .line 468
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    const-string v8, " = "

    .line 472
    .line 473
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    const-string v7, " AND ("

    .line 480
    .line 481
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 482
    .line 483
    .line 484
    const-string v7, "options"

    .line 485
    .line 486
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    .line 488
    .line 489
    const-string v7, "&"

    .line 490
    .line 491
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 495
    .line 496
    .line 497
    const-string v7, "=0)))"

    .line 498
    .line 499
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v7

    .line 506
    move-object v5, p0

    .line 507
    move-object/from16 v6, p1

    .line 508
    .line 509
    move-object/from16 v8, p2

    .line 510
    .line 511
    move-object/from16 v9, p3

    .line 512
    .line 513
    move-object/from16 v10, p4

    .line 514
    .line 515
    invoke-direct/range {v5 .. v10}, Lz1/c2;->Z(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 516
    .line 517
    .line 518
    new-instance v6, Ljava/util/ArrayList;

    .line 519
    .line 520
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 521
    .line 522
    .line 523
    new-instance v7, Ljava/util/ArrayList;

    .line 524
    .line 525
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 526
    .line 527
    .line 528
    filled-new-array {v14}, [I

    .line 529
    .line 530
    .line 531
    move-result-object v8

    .line 532
    invoke-static {v8}, Lcom/android/launcher3/util/z0;->wrap([I)Lcom/android/launcher3/util/z0;

    .line 533
    .line 534
    .line 535
    move-result-object v8

    .line 536
    iget-object v9, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 537
    .line 538
    invoke-static {v9}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 539
    .line 540
    .line 541
    move-result-object v9

    .line 542
    invoke-static {v8, v9}, Lz1/r3;->b(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/P2;)Ljava/util/function/Predicate;

    .line 543
    .line 544
    .line 545
    move-result-object v8

    .line 546
    iget-object v9, p0, Lz1/c2;->l:Lz1/y0;

    .line 547
    .line 548
    iget-object v9, v9, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 549
    .line 550
    new-instance v10, Lz1/Z1;

    .line 551
    .line 552
    invoke-direct {v10, v8, v7, v6}, Lz1/Z1;-><init>(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 553
    .line 554
    .line 555
    invoke-interface {v9, v10}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 556
    .line 557
    .line 558
    iget-object v8, p0, Lz1/c2;->q:Lz1/O;

    .line 559
    .line 560
    invoke-virtual {v8, v6}, Lz1/O;->Z(Ljava/util/ArrayList;)V

    .line 561
    .line 562
    .line 563
    const-string v8, "LoaderTask"

    .line 564
    .line 565
    new-instance v9, Ljava/lang/StringBuilder;

    .line 566
    .line 567
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 568
    .line 569
    .line 570
    const-string v10, "loadAndBindWorkspaceOptimize 3.0 items to bind "

    .line 571
    .line 572
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 576
    .line 577
    .line 578
    move-result v10

    .line 579
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    const-string v10, " "

    .line 583
    .line 584
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 588
    .line 589
    .line 590
    move-result v10

    .line 591
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    const-string v10, "-"

    .line 595
    .line 596
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    iget-boolean v10, p0, Lz1/c2;->F:Z

    .line 600
    .line 601
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object v9

    .line 608
    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    .line 610
    .line 611
    invoke-static {}, Lx1/O;->k1()Z

    .line 612
    .line 613
    .line 614
    move-result v8

    .line 615
    if-eqz v8, :cond_3

    .line 616
    .line 617
    iget-object v8, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 618
    .line 619
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 620
    .line 621
    .line 622
    move-result-object v8

    .line 623
    invoke-static {v8, v6, v7}, La1/d;->C(Lcom/android/launcher3/P2;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 624
    .line 625
    .line 626
    :cond_3
    iget-object v8, p0, Lz1/c2;->q:Lz1/O;

    .line 627
    .line 628
    iget-object v9, v8, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 629
    .line 630
    invoke-virtual {v8, v6, v9}, Lz1/O;->I(Ljava/util/ArrayList;Ljava/util/concurrent/Executor;)V

    .line 631
    .line 632
    .line 633
    iget-object v8, p0, Lz1/c2;->q:Lz1/O;

    .line 634
    .line 635
    iget-object v9, v8, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 636
    .line 637
    invoke-virtual {v8, v7, v9}, Lz1/O;->B(Ljava/util/List;Ljava/util/concurrent/Executor;)V

    .line 638
    .line 639
    .line 640
    if-eqz v4, :cond_4

    .line 641
    .line 642
    iget-object v4, p0, Lz1/c2;->q:Lz1/O;

    .line 643
    .line 644
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 645
    .line 646
    .line 647
    move-result v6

    .line 648
    invoke-virtual {v4, v0, v6, v11}, Lz1/O;->U(Lcom/android/launcher3/util/z0;IZ)V

    .line 649
    .line 650
    .line 651
    move v4, v11

    .line 652
    :cond_4
    add-int/lit8 v13, v13, 0x1

    .line 653
    .line 654
    goto/16 :goto_0

    .line 655
    .line 656
    :cond_5
    invoke-static {}, Lx1/O;->L()Z

    .line 657
    .line 658
    .line 659
    move-result v1

    .line 660
    if-eqz v1, :cond_6

    .line 661
    .line 662
    invoke-direct/range {p0 .. p4}, Lz1/c2;->u0(Ljava/util/List;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 663
    .line 664
    .line 665
    :cond_6
    if-eqz v4, :cond_7

    .line 666
    .line 667
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 668
    .line 669
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 670
    .line 671
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 672
    .line 673
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 674
    .line 675
    .line 676
    move-result v2

    .line 677
    invoke-virtual {v1, v0, v2, v11}, Lz1/O;->U(Lcom/android/launcher3/util/z0;IZ)V

    .line 678
    .line 679
    .line 680
    :cond_7
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 681
    .line 682
    .line 683
    iget-object v1, p0, Lz1/c2;->q:Lz1/O;

    .line 684
    .line 685
    invoke-virtual {v1, v0}, Lz1/O;->O(Lcom/android/launcher3/util/z0;)V

    .line 686
    .line 687
    .line 688
    iget-object v0, p0, Lz1/c2;->q:Lz1/O;

    .line 689
    .line 690
    invoke-virtual {v0}, Lz1/O;->X()V

    .line 691
    .line 692
    .line 693
    iget-object v0, p0, Lz1/c2;->q:Lz1/O;

    .line 694
    .line 695
    invoke-virtual {v0}, Lz1/O;->F()V

    .line 696
    .line 697
    .line 698
    invoke-direct {p0}, Lz1/c2;->f0()V

    .line 699
    .line 700
    .line 701
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 702
    .line 703
    .line 704
    return-void

    .line 705
    :catchall_0
    move-exception v0

    .line 706
    move-object p0, v0

    .line 707
    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 708
    throw p0

    .line 709
    :catchall_1
    move-exception v0

    .line 710
    move-object p0, v0

    .line 711
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 712
    throw p0
.end method

.method private W()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
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
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 7
    .line 8
    iget-object v1, v1, Lz1/y0;->c:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lz1/c2;->k:Lz1/m;

    .line 14
    .line 15
    invoke-virtual {v1}, Lz1/m;->q()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lz1/c2;->t:LD1/t;

    .line 22
    .line 23
    invoke-virtual {v1}, LD1/t;->p()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/os/UserHandle;

    .line 42
    .line 43
    iget-object v3, p0, Lz1/c2;->s:Landroid/os/UserManager;

    .line 44
    .line 45
    invoke-virtual {v3, v2}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    new-instance v3, LN1/f;

    .line 52
    .line 53
    iget-object v4, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 54
    .line 55
    invoke-direct {v3, v4, v2}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 56
    .line 57
    .line 58
    const/16 v4, 0xb

    .line 59
    .line 60
    invoke-virtual {v3, v4}, LN1/f;->d(I)LN1/f$a;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    iget-object v4, p0, Lz1/c2;->l:Lz1/y0;

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    invoke-virtual {v4, v5, v2, v3}, Lz1/y0;->v(Ljava/lang/String;Landroid/os/UserHandle;Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    return-object v0
.end method

.method private X()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/c2;->k:Lz1/m;

    .line 4
    .line 5
    iget-object v1, v1, Lz1/m;->a:Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/android/launcher3/folder/FolderNameProvider;->i(Lz1/y0;)Lcom/android/launcher3/util/A0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/folder/FolderNameProvider;->p(Landroid/content/Context;Ljava/util/List;Lcom/android/launcher3/util/A0;)Lcom/android/launcher3/folder/FolderNameProvider;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 18
    .line 19
    monitor-enter v1

    .line 20
    :try_start_0
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 21
    .line 22
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    new-instance v3, Lz1/M1;

    .line 29
    .line 30
    invoke-direct {v3}, Lz1/M1;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v3, Lz1/O1;

    .line 38
    .line 39
    invoke-direct {v3, p0, v0}, Lz1/O1;-><init>(Lz1/c2;Lcom/android/launcher3/folder/FolderNameProvider;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 43
    .line 44
    .line 45
    monitor-exit v1

    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method private Y()Lcom/android/launcher3/util/z0;
    .locals 8

    .line 1
    const-string v0, "screen"

    .line 2
    .line 3
    const-string v4, "container = -100 AND (options&8=0  )"

    .line 4
    .line 5
    new-instance v7, Lcom/android/launcher3/util/z0;

    .line 6
    .line 7
    invoke-direct {v7}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object p0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 17
    .line 18
    filled-new-array {v0}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const-string v6, "screen ASC"

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    invoke-virtual/range {v1 .. v6}, Lz1/k2;->Y(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 26
    .line 27
    .line 28
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v7, v1}, Lcom/android/launcher3/util/z0;->add(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object v1, v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    .line 52
    .line 53
    return-object v7

    .line 54
    :catch_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    goto :goto_3

    .line 57
    :goto_1
    if-eqz p0, :cond_1

    .line 58
    .line 59
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :catchall_1
    move-exception v0

    .line 64
    move-object p0, v0

    .line 65
    :try_start_4
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_2
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 69
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v1, "loadScreenSet: "

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v0, "LoaderTask"

    .line 87
    .line 88
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    return-object v7
.end method

.method private Z(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Lz1/B1;",
            "Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "LoadWorkspace"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct/range {p0 .. p5}, Lz1/c2;->a0(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 10
    .line 11
    .line 12
    const-string p1, "loadWorkspace finished"

    .line 13
    .line 14
    invoke-static {p1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lz1/c2;->l:Lz1/y0;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lz1/y0;->h:Z

    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    move-object p0, v0

    .line 25
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 26
    .line 27
    .line 28
    throw p0
.end method

.method public static synthetic a(Lz1/c2;Ljava/util/ArrayList;Lcom/android/launcher3/resource/h1$h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/c2;->T(Ljava/util/ArrayList;Lcom/android/launcher3/resource/h1$h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a0(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Lz1/B1;",
            "Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/N5;->w()Z

    .line 4
    .line 5
    .line 6
    move-result v17

    .line 7
    new-instance v0, Lcom/android/launcher3/widget/V0;

    .line 8
    .line 9
    iget-object v2, v1, Lz1/c2;->g:Landroid/content/Context;

    .line 10
    .line 11
    iget-boolean v3, v1, Lz1/c2;->j:Z

    .line 12
    .line 13
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/widget/V0;-><init>(Landroid/content/Context;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, v1, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v2, v1, Lz1/c2;->l:Lz1/y0;

    .line 23
    .line 24
    monitor-enter v2

    .line 25
    :try_start_0
    iget-object v4, v1, Lz1/c2;->v:LD1/b;

    .line 26
    .line 27
    invoke-virtual {v4}, LD1/b;->b()Ljava/util/HashMap;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    iput-object v9, v1, Lz1/c2;->z:Ljava/util/HashMap;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object/from16 v23, v2

    .line 42
    .line 43
    goto/16 :goto_8

    .line 44
    .line 45
    :cond_0
    :goto_0
    iget-object v4, v1, Lz1/c2;->w:Ls1/P;

    .line 46
    .line 47
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance v5, Lz1/V1;

    .line 51
    .line 52
    invoke-direct {v5, v4}, Lz1/V1;-><init>(Ls1/P;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v9, v5}, Ljava/util/HashMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 56
    .line 57
    .line 58
    const-string v4, "LoaderTask"

    .line 59
    .line 60
    new-instance v5, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v6, "loadWorkspace: Packages with active install/update sessions: "

    .line 66
    .line 67
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-interface {v6}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    new-instance v7, Lz1/W1;

    .line 79
    .line 80
    invoke-direct {v7}, Lz1/W1;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-interface {v6, v7}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-interface {v6}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-static {v4, v5}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    new-instance v4, Lz1/R0;

    .line 102
    .line 103
    invoke-direct {v4, v9}, Lz1/R0;-><init>(Ljava/util/Map;)V

    .line 104
    .line 105
    .line 106
    iput-object v4, v1, Lz1/c2;->p:Lz1/R0;

    .line 107
    .line 108
    new-instance v4, Ljava/util/HashMap;

    .line 109
    .line 110
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v4, v1, Lz1/c2;->y:Ljava/util/Map;

    .line 114
    .line 115
    iget-boolean v4, v1, Lz1/c2;->F:Z

    .line 116
    .line 117
    const/4 v10, 0x0

    .line 118
    if-eqz v4, :cond_1

    .line 119
    .line 120
    const-string v4, "itemType DESC"

    .line 121
    .line 122
    move-object v8, v4

    .line 123
    goto :goto_1

    .line 124
    :cond_1
    move-object v8, v10

    .line 125
    :goto_1
    iget-object v11, v1, Lz1/c2;->m:Lz1/y1$a;

    .line 126
    .line 127
    sget-object v4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 128
    .line 129
    const/4 v5, 0x0

    .line 130
    const/4 v7, 0x0

    .line 131
    move-object/from16 v6, p2

    .line 132
    .line 133
    invoke-virtual/range {v3 .. v8}, Lz1/k2;->Y(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget-object v4, v1, Lz1/c2;->x:Lz1/L4;

    .line 138
    .line 139
    iget-boolean v5, v1, Lz1/c2;->o:Z

    .line 140
    .line 141
    if-eqz v5, :cond_2

    .line 142
    .line 143
    move-object/from16 v5, p5

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_2
    move-object v5, v10

    .line 147
    :goto_2
    invoke-interface {v11, v3, v4, v5}, Lz1/y1$a;->a(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)Lz1/y1;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3}, Landroid/database/CursorWrapper;->getExtras()Landroid/os/Bundle;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    if-nez v4, :cond_3

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_3
    const-string v5, "db_name"

    .line 159
    .line 160
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v10

    .line 164
    :goto_3
    iput-object v10, v1, Lz1/c2;->E:Ljava/lang/String;

    .line 165
    .line 166
    const-string v4, "LoaderTask"

    .line 167
    .line 168
    new-instance v5, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v6, "loadWorkspaceImpl selection: "

    .line 174
    .line 175
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    move-object/from16 v6, p2

    .line 179
    .line 180
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v6, " / "

    .line 184
    .line 185
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v3}, Landroid/database/CursorWrapper;->getCount()I

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    .line 201
    .line 202
    :try_start_1
    new-instance v4, Landroid/util/LongSparseArray;

    .line 203
    .line 204
    invoke-direct {v4}, Landroid/util/LongSparseArray;-><init>()V

    .line 205
    .line 206
    .line 207
    iget-object v5, v1, Lz1/c2;->g:Landroid/content/Context;

    .line 208
    .line 209
    invoke-direct {v1, v5, v4}, Lz1/c2;->j0(Landroid/content/Context;Landroid/util/LongSparseArray;)V

    .line 210
    .line 211
    .line 212
    new-instance v5, Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .line 216
    .line 217
    iput-object v5, v1, Lz1/c2;->A:Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_d

    .line 218
    .line 219
    move-object v5, v2

    .line 220
    :try_start_2
    new-instance v2, Lz1/y5;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_c

    .line 221
    .line 222
    move-object v6, v5

    .line 223
    :try_start_3
    iget-object v5, v1, Lz1/c2;->t:LD1/t;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_b

    .line 224
    .line 225
    move-object v7, v6

    .line 226
    :try_start_4
    iget-object v6, v1, Lz1/c2;->x:Lz1/L4;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_a

    .line 227
    .line 228
    move-object v8, v7

    .line 229
    :try_start_5
    iget-object v7, v1, Lz1/c2;->r:Landroid/content/pm/LauncherApps;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_9

    .line 230
    .line 231
    move-object v10, v8

    .line 232
    :try_start_6
    iget-object v8, v1, Lz1/c2;->C:Ljava/util/Set;

    .line 233
    .line 234
    move-object/from16 v16, v9

    .line 235
    .line 236
    iget-object v9, v1, Lz1/c2;->y:Ljava/util/Map;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_8

    .line 237
    .line 238
    move-object v11, v10

    .line 239
    :try_start_7
    iget-object v10, v1, Lz1/c2;->g:Landroid/content/Context;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 240
    .line 241
    move-object v12, v11

    .line 242
    :try_start_8
    iget-object v11, v1, Lz1/c2;->i:Lcom/android/launcher3/F1;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    .line 243
    .line 244
    move-object v13, v12

    .line 245
    :try_start_9
    iget-object v12, v1, Lz1/c2;->w:Ls1/P;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 246
    .line 247
    move-object v14, v13

    .line 248
    :try_start_a
    iget-boolean v13, v1, Lz1/c2;->j:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 249
    .line 250
    move-object v15, v14

    .line 251
    :try_start_b
    iget-object v14, v1, Lz1/c2;->l:Lz1/y0;

    .line 252
    .line 253
    move-object/from16 v18, v0

    .line 254
    .line 255
    iget-object v0, v1, Lz1/c2;->u:Lcom/android/launcher3/util/J1;

    .line 256
    .line 257
    move-object/from16 v19, v0

    .line 258
    .line 259
    iget-object v0, v1, Lz1/c2;->A:Ljava/util/List;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 260
    .line 261
    move-object/from16 v22, p1

    .line 262
    .line 263
    move-object/from16 v20, v0

    .line 264
    .line 265
    move-object/from16 v21, v4

    .line 266
    .line 267
    move-object/from16 v23, v15

    .line 268
    .line 269
    move-object/from16 v15, p3

    .line 270
    .line 271
    move-object/from16 v4, p4

    .line 272
    .line 273
    :try_start_c
    invoke-direct/range {v2 .. v22}, Lz1/y5;-><init>(Lz1/y1;Lz1/B1;LD1/t;Lz1/L4;Landroid/content/pm/LauncherApps;Ljava/util/Set;Ljava/util/Map;Landroid/content/Context;Lcom/android/launcher3/F1;Ls1/P;ZLz1/y0;Ljava/util/Map;Ljava/util/HashMap;ZLcom/android/launcher3/widget/V0;Lcom/android/launcher3/util/J1;Ljava/util/List;Landroid/util/LongSparseArray;Ljava/util/List;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v2, v1}, Lz1/y5;->h(Lz1/c2;)V

    .line 277
    .line 278
    .line 279
    iget-object v0, v1, Lz1/c2;->s:Landroid/os/UserManager;

    .line 280
    .line 281
    invoke-virtual {v2, v0}, Lz1/y5;->i(Landroid/os/UserManager;)V

    .line 282
    .line 283
    .line 284
    iget-boolean v0, v1, Lz1/c2;->B:Z

    .line 285
    .line 286
    if-eqz v0, :cond_4

    .line 287
    .line 288
    const-string v0, "LoaderTask"

    .line 289
    .line 290
    const-string v2, "loadWorkspaceImpl: Loader stopped, skipping item processing"

    .line 291
    .line 292
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    goto :goto_5

    .line 296
    :catchall_1
    move-exception v0

    .line 297
    goto/16 :goto_7

    .line 298
    .line 299
    :cond_4
    :goto_4
    iget-boolean v0, v1, Lz1/c2;->B:Z

    .line 300
    .line 301
    if-nez v0, :cond_5

    .line 302
    .line 303
    invoke-virtual {v3}, Lz1/y1;->moveToNext()Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_5

    .line 308
    .line 309
    invoke-virtual {v2}, Lz1/y5;->e()V

    .line 310
    .line 311
    .line 312
    goto :goto_4

    .line 313
    :cond_5
    :goto_5
    iget-object v0, v1, Lz1/c2;->A:Ljava/util/List;

    .line 314
    .line 315
    invoke-direct {v1, v0}, Lz1/c2;->v0(Ljava/util/List;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 316
    .line 317
    .line 318
    :try_start_d
    iget-boolean v0, v1, Lz1/c2;->F:Z

    .line 319
    .line 320
    if-eqz v0, :cond_6

    .line 321
    .line 322
    invoke-virtual {v3}, Lz1/y1;->j0()V

    .line 323
    .line 324
    .line 325
    goto :goto_6

    .line 326
    :catchall_2
    move-exception v0

    .line 327
    goto/16 :goto_8

    .line 328
    .line 329
    :cond_6
    :goto_6
    invoke-static {v3}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 330
    .line 331
    .line 332
    iget-object v0, v1, Lz1/c2;->n:Lz1/m2;

    .line 333
    .line 334
    iget-object v2, v1, Lz1/c2;->x:Lz1/L4;

    .line 335
    .line 336
    iget-object v4, v1, Lz1/c2;->q:Lz1/O;

    .line 337
    .line 338
    iget-object v4, v4, Lz1/O;->g:[Lz1/y0$b;

    .line 339
    .line 340
    iget-object v5, v1, Lz1/c2;->y:Ljava/util/Map;

    .line 341
    .line 342
    invoke-virtual {v0, v2, v4, v5}, Lz1/m2;->g(Lz1/L4;[Lz1/y0$b;Ljava/util/Map;)V

    .line 343
    .line 344
    .line 345
    iget-object v0, v1, Lz1/c2;->n:Lz1/m2;

    .line 346
    .line 347
    iget-object v2, v1, Lz1/c2;->x:Lz1/L4;

    .line 348
    .line 349
    iget-object v4, v1, Lz1/c2;->q:Lz1/O;

    .line 350
    .line 351
    iget-object v4, v4, Lz1/O;->g:[Lz1/y0$b;

    .line 352
    .line 353
    iget-object v5, v1, Lz1/c2;->y:Ljava/util/Map;

    .line 354
    .line 355
    invoke-virtual {v0, v2, v4, v5}, Lz1/m2;->e(Lz1/L4;[Lz1/y0$b;Ljava/util/Map;)V

    .line 356
    .line 357
    .line 358
    iget-object v0, v1, Lz1/c2;->n:Lz1/m2;

    .line 359
    .line 360
    iget-object v2, v1, Lz1/c2;->q:Lz1/O;

    .line 361
    .line 362
    iget-object v2, v2, Lz1/O;->g:[Lz1/y0$b;

    .line 363
    .line 364
    invoke-virtual {v0, v2}, Lz1/m2;->f([Lz1/y0$b;)V

    .line 365
    .line 366
    .line 367
    iget-object v0, v1, Lz1/c2;->n:Lz1/m2;

    .line 368
    .line 369
    invoke-virtual {v0}, Lz1/m2;->i()V

    .line 370
    .line 371
    .line 372
    iget-boolean v0, v1, Lz1/c2;->B:Z

    .line 373
    .line 374
    if-eqz v0, :cond_7

    .line 375
    .line 376
    iget-object v0, v1, Lz1/c2;->l:Lz1/y0;

    .line 377
    .line 378
    invoke-virtual {v0}, Lz1/y0;->l()V

    .line 379
    .line 380
    .line 381
    const-string v0, "LoaderTask"

    .line 382
    .line 383
    const-string v2, "mBgDataModel is going to be cleared "

    .line 384
    .line 385
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    .line 387
    .line 388
    iget-object v0, v1, Lz1/c2;->M:Ljava/util/HashMap;

    .line 389
    .line 390
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 391
    .line 392
    .line 393
    monitor-exit v23

    .line 394
    return-void

    .line 395
    :cond_7
    invoke-virtual {v3}, Lz1/y1;->g()Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    iput-boolean v0, v1, Lz1/c2;->D:Z

    .line 400
    .line 401
    invoke-direct {v1}, Lz1/c2;->i0()V

    .line 402
    .line 403
    .line 404
    invoke-direct {v1}, Lz1/c2;->h0()V

    .line 405
    .line 406
    .line 407
    invoke-virtual {v3}, Lz1/y1;->j()V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v3}, Lz1/y1;->n()Z

    .line 411
    .line 412
    .line 413
    monitor-exit v23

    .line 414
    return-void

    .line 415
    :catchall_3
    move-exception v0

    .line 416
    move-object/from16 v23, v15

    .line 417
    .line 418
    goto :goto_7

    .line 419
    :catchall_4
    move-exception v0

    .line 420
    move-object/from16 v23, v14

    .line 421
    .line 422
    goto :goto_7

    .line 423
    :catchall_5
    move-exception v0

    .line 424
    move-object/from16 v23, v13

    .line 425
    .line 426
    goto :goto_7

    .line 427
    :catchall_6
    move-exception v0

    .line 428
    move-object/from16 v23, v12

    .line 429
    .line 430
    goto :goto_7

    .line 431
    :catchall_7
    move-exception v0

    .line 432
    move-object/from16 v23, v11

    .line 433
    .line 434
    goto :goto_7

    .line 435
    :catchall_8
    move-exception v0

    .line 436
    move-object/from16 v23, v10

    .line 437
    .line 438
    goto :goto_7

    .line 439
    :catchall_9
    move-exception v0

    .line 440
    move-object/from16 v23, v8

    .line 441
    .line 442
    goto :goto_7

    .line 443
    :catchall_a
    move-exception v0

    .line 444
    move-object/from16 v23, v7

    .line 445
    .line 446
    goto :goto_7

    .line 447
    :catchall_b
    move-exception v0

    .line 448
    move-object/from16 v23, v6

    .line 449
    .line 450
    goto :goto_7

    .line 451
    :catchall_c
    move-exception v0

    .line 452
    move-object/from16 v23, v5

    .line 453
    .line 454
    goto :goto_7

    .line 455
    :catchall_d
    move-exception v0

    .line 456
    move-object/from16 v23, v2

    .line 457
    .line 458
    :goto_7
    iget-boolean v1, v1, Lz1/c2;->F:Z

    .line 459
    .line 460
    if-eqz v1, :cond_8

    .line 461
    .line 462
    invoke-virtual {v3}, Lz1/y1;->j0()V

    .line 463
    .line 464
    .line 465
    :cond_8
    invoke-static {v3}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 466
    .line 467
    .line 468
    throw v0

    .line 469
    :goto_8
    monitor-exit v23
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 470
    throw v0
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method private static b0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "LoaderTask"

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/l;

    .line 2
    .line 3
    return p0
.end method

.method private c0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->M0()Z

    .line 12
    .line 13
    .line 14
    const-string p0, "LoaderTask"

    .line 15
    .line 16
    const-string v0, "do not need to create work folder."

    .line 17
    .line 18
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static synthetic d(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    return-void
.end method

.method private d0()V
    .locals 4

    .line 1
    const-string v0, "LoaderTask.onLoadCompleted"

    .line 2
    .line 3
    const-string v1, "LoaderTask"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lz1/c2;->F:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v2}, Lcom/android/launcher3/b0;->t(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Lcom/android/launcher3/c1;->y()Lcom/android/launcher3/c1$e;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Lcom/android/launcher3/H5;->y1(Lcom/android/launcher3/c1$e;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/android/launcher3/c1;->q()Lcom/android/launcher3/c1$d;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v2}, Lcom/android/launcher3/H5;->o1(Lcom/android/launcher3/c1$d;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->h()V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Lcom/android/launcher3/H5;->U0(Landroid/content/Context;)V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    const/4 v2, 0x1

    .line 109
    if-eqz v0, :cond_1

    .line 110
    .line 111
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0, v2}, Lcom/android/launcher3/globalsearch/s;->h(Z)V

    .line 120
    .line 121
    .line 122
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v3, "step 5 completed verifyApplications streamer: "

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->z()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v3, " ,singleLayer: "

    .line 144
    .line 145
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 149
    .line 150
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->M0()Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v3, " ,streamerModeChanging: "

    .line 166
    .line 167
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->A()Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 189
    .line 190
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_2

    .line 203
    .line 204
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->A()Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-nez v0, :cond_2

    .line 213
    .line 214
    invoke-direct {p0}, Lz1/c2;->x0()V

    .line 215
    .line 216
    .line 217
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_3

    .line 226
    .line 227
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-eqz v0, :cond_3

    .line 236
    .line 237
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 238
    .line 239
    invoke-static {v0}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-eqz v0, :cond_3

    .line 244
    .line 245
    invoke-static {}, Lx1/Y;->h()Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-eqz v0, :cond_3

    .line 250
    .line 251
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 252
    .line 253
    new-instance v1, Lx1/x;

    .line 254
    .line 255
    new-instance v3, Lz1/F1;

    .line 256
    .line 257
    invoke-direct {v3, p0}, Lz1/F1;-><init>(Lz1/c2;)V

    .line 258
    .line 259
    .line 260
    invoke-direct {v1, v3, v2}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 264
    .line 265
    .line 266
    :cond_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-eqz v0, :cond_4

    .line 271
    .line 272
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 273
    .line 274
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->w1()V

    .line 275
    .line 276
    .line 277
    :cond_4
    invoke-static {}, Lx1/O;->A5()Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-eqz v0, :cond_5

    .line 282
    .line 283
    const/16 v0, 0xca

    .line 284
    .line 285
    invoke-static {v0}, Lx1/O;->A4(I)V

    .line 286
    .line 287
    .line 288
    :cond_5
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 289
    .line 290
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0}, Lcom/android/launcher3/b0;->h()Ljava/util/ArrayList;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    if-lez v0, :cond_6

    .line 311
    .line 312
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 313
    .line 314
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    iget-object p0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 327
    .line 328
    invoke-virtual {v0, p0}, Lcom/android/launcher3/b0;->c(Lcom/android/launcher3/D3;)V

    .line 329
    .line 330
    .line 331
    :cond_6
    return-void
.end method

.method public static synthetic e(Lz1/c2;Lcom/android/launcher3/resource/h1$h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/c2;->S(Lcom/android/launcher3/resource/h1$h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e0(Lcom/android/launcher3/util/x0;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "[ "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->A()[I

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    array-length v0, p1

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-ge v1, v0, :cond_0

    .line 18
    .line 19
    aget v2, p1, v1

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 22
    .line 23
    .line 24
    const-string v2, "-"

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p1, " ]"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic f(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    invoke-interface {p0, p3}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget p0, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 8
    .line 9
    const/16 v0, -0x65

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    sget-object p0, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 14
    .line 15
    invoke-interface {p0, p3}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move-object p1, p2

    .line 23
    :goto_0
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private f0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-boolean v1, p0, Lz1/c2;->F:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Lz1/c2;->l:Lz1/y0;

    .line 30
    .line 31
    iget-boolean p0, p0, Lz1/c2;->G:Z

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3, v0, p0}, Lcom/android/launcher3/b0;->g(Lcom/android/launcher3/F1;Lz1/y0;Landroid/content/Context;Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->A()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const/4 v1, 0x1

    .line 45
    const/4 v2, 0x0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-static {v0}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v1}, Lx1/C;->e(Z)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/B;->I(Z)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->y()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_4

    .line 71
    .line 72
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/B;->H(Z)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->y()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_2

    .line 89
    .line 90
    invoke-static {v0}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v1}, Lx1/C;->e(Z)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/B;->H(Z)V

    .line 102
    .line 103
    .line 104
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->t()Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-eqz p0, :cond_3

    .line 113
    .line 114
    invoke-static {v0}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0, v1}, Lx1/C;->e(Z)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/B;->F(Z)V

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->q()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_4

    .line 137
    .line 138
    invoke-static {v0}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0, v1}, Lx1/C;->e(Z)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/B;->D(Z)V

    .line 150
    .line 151
    .line 152
    :cond_4
    return-void
.end method

.method public static synthetic g(Ljava/util/ArrayList;Lcom/android/launcher3/folder/A;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/A;->k(I)Lcom/android/launcher3/folder/A;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private g0(Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/b0;->l()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput-boolean v0, p0, Lz1/c2;->F:Z

    .line 20
    .line 21
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-boolean v1, p0, Lz1/c2;->F:Z

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lz1/c2;->n:Lz1/m2;

    .line 32
    .line 33
    invoke-virtual {v0, p1, v1}, Lz1/k2;->k0(Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Lz1/m2;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const-string p1, "LoaderTask"

    .line 37
    .line 38
    const-string v1, "preLoadWorkspace: loading default favorites"

    .line 39
    .line 40
    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lz1/k2;->N()V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lz1/c2;->l:Lz1/y0;

    .line 47
    .line 48
    monitor-enter p1

    .line 49
    :try_start_0
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 50
    .line 51
    invoke-virtual {v0}, Lz1/y0;->l()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lz1/c2;->C:Ljava/util/Set;

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lz1/c2;->M:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 62
    .line 63
    .line 64
    monitor-exit p1

    .line 65
    return-void

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    throw p0
.end method

.method public static synthetic h(Lz1/c2;Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/c2;->O(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 2
    .line 3
    iget-object v0, v0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lz1/J1;

    .line 10
    .line 11
    invoke-direct {v1}, Lz1/J1;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Lz1/K1;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lz1/K1;-><init>(Lz1/c2;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic i(Lz1/c2;Ljava/util/List;Ljava/util/List;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/c2;->L(Ljava/util/List;Ljava/util/List;Landroid/util/Pair;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lz1/c2;->i:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lz1/S1;

    .line 10
    .line 11
    invoke-direct {v1}, Lz1/S1;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 23
    .line 24
    iget-object v1, v1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_3

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    instance-of v3, v2, Lcom/android/launcher3/model/data/p;

    .line 43
    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    check-cast v2, Lcom/android/launcher3/model/data/p;

    .line 47
    .line 48
    new-instance v3, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 55
    .line 56
    .line 57
    sget-object v2, Lcom/android/launcher3/folder/Folder;->H0:Ljava/util/Comparator;

    .line 58
    .line 59
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Lz1/T1;

    .line 63
    .line 64
    invoke-direct {v2, v3}, Lz1/T1;-><init>(Ljava/util/ArrayList;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    const/4 v4, 0x0

    .line 75
    :goto_0
    if-ge v4, v2, :cond_0

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 82
    .line 83
    iput v4, v5, Lcom/android/launcher3/model/data/y;->rank:I

    .line 84
    .line 85
    instance-of v6, v5, Lcom/android/launcher3/model/data/I;

    .line 86
    .line 87
    if-eqz v6, :cond_1

    .line 88
    .line 89
    move-object v6, v5

    .line 90
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 91
    .line 92
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    sget-object v8, Lcom/android/launcher3/S3;->b:Lt1/g;

    .line 97
    .line 98
    invoke-virtual {v7, v8}, Lt1/g;->b(Lt1/g;)Z

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-eqz v7, :cond_1

    .line 103
    .line 104
    iget v7, v6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 105
    .line 106
    if-nez v7, :cond_1

    .line 107
    .line 108
    iget-object v5, p0, Lz1/c2;->w:Ls1/P;

    .line 109
    .line 110
    invoke-virtual {v5, v6, v8}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    instance-of v6, v5, Lcom/android/launcher3/model/data/l;

    .line 115
    .line 116
    if-eqz v6, :cond_2

    .line 117
    .line 118
    check-cast v5, Lcom/android/launcher3/model/data/l;

    .line 119
    .line 120
    iget-object v6, p0, Lz1/c2;->w:Ls1/P;

    .line 121
    .line 122
    invoke-virtual {v5, v6}, Lcom/android/launcher3/model/data/l;->G(Ls1/P;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_3
    return-void
.end method

.method public static synthetic j(Lz1/c2;Lt1/n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/c2;->Q(Lt1/n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j0(Landroid/content/Context;Landroid/util/LongSparseArray;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/c2;->x:Lz1/L4;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/c2;->t:LD1/t;

    .line 4
    .line 5
    iget-object v2, p0, Lz1/c2;->s:Landroid/os/UserManager;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lz1/L4;->a(LD1/t;Landroid/os/UserManager;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lz1/c2;->t:LD1/t;

    .line 11
    .line 12
    invoke-virtual {v0}, LD1/t;->p()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_5

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/os/UserHandle;

    .line 31
    .line 32
    iget-object v2, p0, Lz1/c2;->t:LD1/t;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    iget-object v4, p0, Lz1/c2;->s:Landroid/os/UserManager;

    .line 39
    .line 40
    invoke-virtual {v4, v1}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_4

    .line 45
    .line 46
    iget-object v5, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 47
    .line 48
    invoke-virtual {v5}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-static {}, Lx1/O;->W3()Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-eqz v6, :cond_0

    .line 57
    .line 58
    invoke-virtual {v5}, Lz1/k2;->W()V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-virtual {v5}, Lz1/k2;->E()Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    new-instance v7, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v8, "need pinned Ai Shortcuts after clear cache: "

    .line 71
    .line 72
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v8, "LoaderTask"

    .line 83
    .line 84
    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    const/4 v7, 0x0

    .line 88
    if-eqz v6, :cond_1

    .line 89
    .line 90
    invoke-virtual {v5}, Lz1/k2;->V()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v5, v7}, Lz1/k2;->g0(Z)V

    .line 94
    .line 95
    .line 96
    :cond_1
    new-instance v5, LN1/f;

    .line 97
    .line 98
    invoke-direct {v5, p1, v1}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 99
    .line 100
    .line 101
    const/4 v6, 0x2

    .line 102
    invoke-virtual {v5, v6}, LN1/f;->d(I)LN1/f$a;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v5}, LN1/f$a;->m()Z

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-eqz v6, :cond_3

    .line 111
    .line 112
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    if-eqz v7, :cond_2

    .line 121
    .line 122
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    check-cast v7, Landroid/content/pm/ShortcutInfo;

    .line 127
    .line 128
    iget-object v9, p0, Lz1/c2;->y:Ljava/util/Map;

    .line 129
    .line 130
    invoke-static {v7}, LN1/e;->b(Landroid/content/pm/ShortcutInfo;)LN1/e;

    .line 131
    .line 132
    .line 133
    move-result-object v10

    .line 134
    invoke-interface {v9, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-eqz v5, :cond_4

    .line 143
    .line 144
    new-instance v5, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v6, "No pinned shortcuts found for user "

    .line 150
    .line 151
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-static {v8, v1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    const-string v5, "Shortcut request failed for user "

    .line 171
    .line 172
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v1, ", user may still be locked."

    .line 179
    .line 180
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-static {v8, v1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    move v4, v7

    .line 191
    :cond_4
    :goto_2
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {p2, v2, v3, v1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :cond_5
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/model/data/p;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private k0(Lcom/android/launcher3/util/z0;I)Lcom/android/launcher3/util/x0;
    .locals 8

    .line 1
    new-instance v0, Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->A()[I

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/x0;->s(Lcom/android/launcher3/util/x0;)V

    .line 22
    .line 23
    .line 24
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    new-instance v1, Lcom/android/launcher3/util/x0;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v3, 0x1

    .line 46
    const/4 v4, 0x0

    .line 47
    if-ne v2, v3, :cond_1

    .line 48
    .line 49
    if-ne p2, v3, :cond_1

    .line 50
    .line 51
    const-string p2, "LoaderTask"

    .line 52
    .line 53
    const-string v2, "Error! Screen index is out of range!"

    .line 54
    .line 55
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move p2, v4

    .line 59
    :cond_1
    const-string v2, "LoaderTask"

    .line 60
    .line 61
    new-instance v5, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v6, "reSortScreenOrder "

    .line 67
    .line 68
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 86
    .line 87
    .line 88
    move v5, v3

    .line 89
    move v2, v4

    .line 90
    :goto_0
    if-ge v5, p1, :cond_4

    .line 91
    .line 92
    rem-int/lit8 v6, v5, 0x2

    .line 93
    .line 94
    if-ne v6, v3, :cond_2

    .line 95
    .line 96
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    sub-int v6, p2, v2

    .line 99
    .line 100
    if-gez v6, :cond_3

    .line 101
    .line 102
    add-int/2addr v6, p1

    .line 103
    goto :goto_1

    .line 104
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 105
    .line 106
    add-int v6, p2, v4

    .line 107
    .line 108
    add-int/lit8 v7, p1, -0x1

    .line 109
    .line 110
    if-le v6, v7, :cond_3

    .line 111
    .line 112
    sub-int/2addr v6, p1

    .line 113
    :cond_3
    :goto_1
    invoke-virtual {v0, v6}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    invoke-virtual {v1, v6}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 118
    .line 119
    .line 120
    add-int/lit8 v5, v5, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    const-string p1, "LoaderTask"

    .line 124
    .line 125
    new-instance p2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v2, "reSortScreenOrder workspaceScreens "

    .line 131
    .line 132
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-direct {p0, v0}, Lz1/c2;->e0(Lcom/android/launcher3/util/x0;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v0, " ordered "

    .line 143
    .line 144
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-direct {p0, v1}, Lz1/c2;->e0(Lcom/android/launcher3/util/x0;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    return-object v1

    .line 162
    :catchall_0
    move-exception p0

    .line 163
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    throw p0
.end method

.method public static synthetic l(Lz1/c2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/c2;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lz1/k2;->n()Lcom/android/launcher3/util/x0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lz1/k2;->u()Lcom/android/launcher3/util/x0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Lcom/android/launcher3/util/x0;

    .line 22
    .line 23
    invoke-direct {v2}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/x0;->o(Lcom/android/launcher3/util/x0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/x0;->o(Lcom/android/launcher3/util/x0;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 33
    .line 34
    monitor-enter v0

    .line 35
    :try_start_0
    invoke-virtual {v2}, Lcom/android/launcher3/util/x0;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p0, Lz1/c2;->l:Lz1/y0;

    .line 56
    .line 57
    iget-object v3, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 58
    .line 59
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->remove(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception p0

    .line 64
    goto :goto_1

    .line 65
    :cond_0
    monitor-exit v0

    .line 66
    return-void

    .line 67
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    throw p0
.end method

.method public static synthetic m(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method private m0(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lz1/k2;->o()Lcom/android/launcher3/util/x0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->iterator()Ljava/util/Iterator;

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
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 37
    .line 38
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    monitor-exit v0

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0

    .line 50
    :cond_1
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method private n0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget v1, p0, Lz1/c2;->H:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const-string v3, "LoaderTask"

    .line 7
    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    const-string v0, "loadWorkspace need call METHOD_REMOVE_GHOST_WIDGETS "

    .line 11
    .line 12
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 16
    .line 17
    new-instance v1, Lx1/x;

    .line 18
    .line 19
    new-instance v2, Lz1/E1;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lz1/E1;-><init>(Lz1/c2;)V

    .line 22
    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-direct {v1, v2, v3}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_0
    invoke-static {}, Lx1/O;->i3()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lx1/c0;->d()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Lz1/y0;->w(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    const-string v0, "sanitizeWidgetsShortcutsAndPackages: updateShortcutPinnedState"

    .line 51
    .line 52
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/launcher3/N5;->w()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lz1/c2;->C:Ljava/util/Set;

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 70
    .line 71
    new-instance v2, Lz1/A4;

    .line 72
    .line 73
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 74
    .line 75
    iget-object v3, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 76
    .line 77
    iget-object p0, p0, Lz1/c2;->C:Ljava/util/Set;

    .line 78
    .line 79
    invoke-direct {v2, v0, v3, p0}, Lz1/A4;-><init>(Landroid/content/Context;Lcom/android/launcher3/D3;Ljava/util/Set;)V

    .line 80
    .line 81
    .line 82
    new-instance v3, Landroid/content/IntentFilter;

    .line 83
    .line 84
    const-string p0, "android.intent.action.BOOT_COMPLETED"

    .line 85
    .line 86
    invoke-direct {v3, p0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sget-object p0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    const/4 v6, 0x2

    .line 96
    const/4 v4, 0x0

    .line 97
    invoke-virtual/range {v1 .. v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method

.method public static synthetic o(Lz1/c2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/c2;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    filled-new-array {v0}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap([I)Lcom/android/launcher3/util/z0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 21
    .line 22
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 29
    .line 30
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-static {v0, v3}, Lz1/r3;->b(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/P2;)Ljava/util/function/Predicate;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v2, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const-string v3, "disable_launcher_broadcast_installed_apps"

    .line 53
    .line 54
    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget-boolean v2, p0, Lz1/c2;->o:Z

    .line 59
    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    if-nez v1, :cond_0

    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/y0;->s()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    iget-object v1, p0, Lz1/c2;->u:Lcom/android/launcher3/util/J1;

    .line 71
    .line 72
    iget-object v2, p0, Lz1/c2;->z:Ljava/util/HashMap;

    .line 73
    .line 74
    iget-object v3, p0, Lz1/c2;->l:Lz1/y0;

    .line 75
    .line 76
    iget-object v3, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    sget-object v4, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 83
    .line 84
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-interface {v3}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-static {v1, v0, v2, v3}, Lz1/T0;->i(Lcom/android/launcher3/util/J1;Ljava/util/List;Ljava/util/Map;Ljava/util/List;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v1, "Sending first screen broadcast with additional archiving Extras"

    .line 97
    .line 98
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {p0, v0}, Lz1/T0;->n(Landroid/content/Context;Ljava/util/List;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_0
    const-string v1, "Sending first screen broadcast"

    .line 108
    .line 109
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lz1/c2;->p:Lz1/R0;

    .line 113
    .line 114
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 115
    .line 116
    invoke-virtual {v1, p0, v0}, Lz1/R0;->h(Landroid/content/Context;Ljava/util/List;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 8
    .line 9
    iget p0, p0, Ls1/d;->d:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    and-int/2addr p0, v0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private p0(Lt1/n;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lz1/c2;->l:Lz1/y0;

    .line 5
    .line 6
    iget-object p0, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

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
    if-eqz v1, :cond_2

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    instance-of v2, v1, Lcom/android/launcher3/model/data/I;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p1, v2, v1}, Lt1/n;->f(Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    instance-of v2, v1, Lcom/android/launcher3/model/data/A;

    .line 59
    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    check-cast v1, Lcom/android/launcher3/model/data/A;

    .line 63
    .line 64
    const/4 v2, 0x2

    .line 65
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_0

    .line 70
    .line 71
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {p1, v2, v1}, Lt1/n;->f(Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    monitor-exit v0

    .line 84
    return-void

    .line 85
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0
.end method

.method public static synthetic q(Lz1/c2;Lcom/android/launcher3/model/data/q;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/c2;->M(Lcom/android/launcher3/model/data/q;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lz1/c2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/c2;->z0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/q;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static synthetic t(Lcom/android/launcher3/util/L1;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Lz1/c2;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/c2;->P(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u0(Ljava/util/List;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Lz1/B1;",
            "Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "(itemType = 2 AND (options&8!=0)) OR (container IN (SELECT _id FROM "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " WHERE "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "itemType"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, " = "

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x2

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, " AND ("

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "options"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "&"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const/16 v1, 0x8

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, "!=0)))"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    move-object v2, p0

    .line 65
    move-object v3, p1

    .line 66
    move-object v5, p2

    .line 67
    move-object v6, p3

    .line 68
    move-object v7, p4

    .line 69
    invoke-direct/range {v2 .. v7}, Lz1/c2;->Z(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 70
    .line 71
    .line 72
    new-instance p0, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance p1, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object p2, v2, Lz1/c2;->l:Lz1/y0;

    .line 83
    .line 84
    monitor-enter p2

    .line 85
    :try_start_0
    iget-object p3, v2, Lz1/c2;->l:Lz1/y0;

    .line 86
    .line 87
    iget-object p3, p3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 88
    .line 89
    invoke-virtual {p3}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-interface {p3}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 98
    .line 99
    .line 100
    iget-object p3, v2, Lz1/c2;->l:Lz1/y0;

    .line 101
    .line 102
    iget-object p3, p3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 103
    .line 104
    invoke-virtual {p3}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    iget-object p2, v2, Lz1/c2;->q:Lz1/O;

    .line 110
    .line 111
    invoke-virtual {p2, p3, p0}, Lz1/O;->M(Lcom/android/launcher3/util/A0;Ljava/util/ArrayList;)Lcom/android/launcher3/model/data/y;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    if-nez p0, :cond_0

    .line 116
    .line 117
    const-string p0, "LoaderTask"

    .line 118
    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string p3, "loadAndBindWorkspaceOptimize tryLoadHideFolder no hide items "

    .line 125
    .line 126
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_0
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    iget-object p0, v2, Lz1/c2;->q:Lz1/O;

    .line 148
    .line 149
    iget-object p2, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 150
    .line 151
    invoke-virtual {p0, p1, p2}, Lz1/O;->I(Ljava/util/ArrayList;Ljava/util/concurrent/Executor;)V

    .line 152
    .line 153
    .line 154
    const-string p0, "LoaderTask"

    .line 155
    .line 156
    new-instance p2, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    const-string p3, "loadAndBindWorkspaceOptimize 4.0 hideItems size: "

    .line 162
    .line 163
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string p1, "-"

    .line 174
    .line 175
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-object p1, v2, Lz1/c2;->l:Lz1/y0;

    .line 179
    .line 180
    iget-object p1, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :catchall_0
    move-exception v0

    .line 198
    move-object p0, v0

    .line 199
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 200
    throw p0
.end method

.method private v(Landroid/content/ComponentName;)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->D0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lx1/O;->l4(Ljava/lang/String;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/util/Pair;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v1, Landroid/content/ComponentName;

    .line 42
    .line 43
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Landroid/content/ComponentName;

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {v1, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v0, "checkIsFakeIcon: true cName = "

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "LoaderTask"

    .line 76
    .line 77
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_3
    const/4 p0, 0x0

    .line 83
    return p0
.end method

.method private v0(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/I;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "LoadWorkspaceIconsInBulk"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lz1/c2;->w:Ls1/P;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ls1/P;->K0(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/model/data/q;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 28
    .line 29
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 30
    .line 31
    iget-object v2, p0, Lz1/c2;->w:Ls1/P;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 34
    .line 35
    iget-object v4, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 36
    .line 37
    invoke-virtual {v2, v3, v4}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v3, "tryLoadWorkspaceIconsInBulk: default icon found for "

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, ", will attempt to load from iconBlob"

    .line 61
    .line 62
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/q;->a(Landroid/content/Context;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catchall_0
    move-exception p0

    .line 83
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 84
    .line 85
    .line 86
    throw p0
.end method

.method private w(Landroid/content/Context;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "LoaderTask"

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const-string p0, "createHideAppFolder return"

    .line 20
    .line 21
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    .line 26
    .line 27
    iget-object v0, v0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v2, Lz1/G1;

    .line 34
    .line 35
    invoke-direct {v2}, Lz1/G1;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/16 v3, 0x8

    .line 55
    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 63
    .line 64
    instance-of v4, v2, Lcom/android/launcher3/model/data/p;

    .line 65
    .line 66
    if-eqz v4, :cond_1

    .line 67
    .line 68
    check-cast v2, Lcom/android/launcher3/model/data/p;

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    const-string p0, "createHideAppFolder return,the Folder exist"

    .line 77
    .line 78
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 88
    .line 89
    const/4 v4, 0x0

    .line 90
    invoke-virtual {v2, v4}, Lz1/y0;->o(I)Lcom/android/launcher3/model/data/y;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    const/16 v4, -0x64

    .line 95
    .line 96
    iput v4, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const v4, 0x7f140005

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 110
    .line 111
    instance-of p1, v2, Lcom/android/launcher3/model/data/p;

    .line 112
    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    move-object p1, v2

    .line 116
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 117
    .line 118
    iput v3, p1, Lcom/android/launcher3/model/data/p;->g:I

    .line 119
    .line 120
    const/4 v3, -0x1

    .line 121
    iput v3, p1, Lcom/android/launcher3/model/data/p;->j:I

    .line 122
    .line 123
    :cond_3
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 127
    .line 128
    new-instance p1, Lx1/O$b;

    .line 129
    .line 130
    invoke-direct {p1, v0}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    const-string p0, "createHideAppFolder"

    .line 141
    .line 142
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method private x(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Lz1/B1;",
            "Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->A1()V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p5}, Lz1/c2;->g0(Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 23
    .line 24
    .line 25
    invoke-direct/range {p0 .. p5}, Lz1/c2;->Z(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lz1/c2;->f0()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "screen_orientation"

    .line 46
    .line 47
    const/4 p3, 0x2

    .line 48
    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p4

    .line 60
    invoke-virtual {p2, p4}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 65
    .line 66
    if-eqz p2, :cond_0

    .line 67
    .line 68
    move p2, p3

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    move p2, v2

    .line 71
    :goto_0
    const-string p4, "LoaderTask"

    .line 72
    .line 73
    new-instance p5, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v3, "LoaderTask oldOrientation = "

    .line 79
    .line 80
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v3, ",currentOrientation = "

    .line 87
    .line 88
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v3, ",island: "

    .line 95
    .line 96
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v3, v4}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 112
    .line 113
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v3, ",numRows: "

    .line 117
    .line 118
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget v3, v3, Lcom/android/launcher3/F1;->G0:I

    .line 126
    .line 127
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v3, ",numColumns: "

    .line 131
    .line 132
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    iget v3, v3, Lcom/android/launcher3/F1;->H0:I

    .line 140
    .line 141
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p5

    .line 148
    invoke-static {p4, p5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    if-eq p1, p2, :cond_3

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object p4

    .line 165
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 166
    .line 167
    .line 168
    move-result-object p5

    .line 169
    if-ne p2, p3, :cond_1

    .line 170
    .line 171
    move p3, v2

    .line 172
    goto :goto_1

    .line 173
    :cond_1
    move p3, v1

    .line 174
    :goto_1
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 175
    .line 176
    .line 177
    move-result-object p3

    .line 178
    invoke-virtual {p1, p4, p5, p3}, Lcom/android/launcher3/b0;->n(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/Boolean;)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lz1/c2;->l:Lz1/y0;

    .line 182
    .line 183
    monitor-enter p1

    .line 184
    :try_start_0
    new-instance p3, Ljava/util/ArrayList;

    .line 185
    .line 186
    iget-object p4, p0, Lz1/c2;->l:Lz1/y0;

    .line 187
    .line 188
    iget-object p4, p4, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 189
    .line 190
    invoke-virtual {p4}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 191
    .line 192
    .line 193
    move-result-object p4

    .line 194
    invoke-interface {p4}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 195
    .line 196
    .line 197
    move-result-object p4

    .line 198
    invoke-direct {p3, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 199
    .line 200
    .line 201
    new-instance p4, Ljava/util/ArrayList;

    .line 202
    .line 203
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-static {v0, p3, p4}, La1/d;->C(Lcom/android/launcher3/P2;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 207
    .line 208
    .line 209
    move-result p4

    .line 210
    if-eqz p4, :cond_2

    .line 211
    .line 212
    const-string p4, "LoaderTask"

    .line 213
    .line 214
    new-instance p5, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    .line 218
    .line 219
    const-string v3, "LoaderTask item size: "

    .line 220
    .line 221
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p5

    .line 235
    invoke-static {p4, p5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    invoke-static {p3, v0, p2}, La1/d;->B(Ljava/util/ArrayList;Lcom/android/launcher3/P2;I)V

    .line 239
    .line 240
    .line 241
    goto :goto_2

    .line 242
    :catchall_0
    move-exception v0

    .line 243
    move-object p0, v0

    .line 244
    goto :goto_3

    .line 245
    :cond_2
    :goto_2
    monitor-exit p1

    .line 246
    goto :goto_4

    .line 247
    :goto_3
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    throw p0

    .line 249
    :cond_3
    :goto_4
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 250
    .line 251
    .line 252
    iget-object p0, p0, Lz1/c2;->q:Lz1/O;

    .line 253
    .line 254
    invoke-virtual {p0, v2, v1}, Lz1/O;->H(ZZ)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :cond_4
    iget-boolean v0, p0, Lz1/c2;->F:Z

    .line 259
    .line 260
    if-eqz v0, :cond_6

    .line 261
    .line 262
    iget-boolean v0, p0, Lz1/c2;->G:Z

    .line 263
    .line 264
    if-eqz v0, :cond_5

    .line 265
    .line 266
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 267
    .line 268
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->A1()V

    .line 277
    .line 278
    .line 279
    :cond_5
    invoke-direct {p0, p5}, Lz1/c2;->g0(Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 280
    .line 281
    .line 282
    invoke-direct/range {p0 .. p5}, Lz1/c2;->Z(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 283
    .line 284
    .line 285
    invoke-direct {p0}, Lz1/c2;->f0()V

    .line 286
    .line 287
    .line 288
    invoke-direct {p0}, Lz1/c2;->y0()V

    .line 289
    .line 290
    .line 291
    iget-object p0, p0, Lz1/c2;->q:Lz1/O;

    .line 292
    .line 293
    invoke-virtual {p0, v2, v1}, Lz1/O;->H(ZZ)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_6
    iget-object p2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 298
    .line 299
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 300
    .line 301
    .line 302
    move-result-object p2

    .line 303
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 304
    .line 305
    .line 306
    move-result-object p2

    .line 307
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->A1()V

    .line 308
    .line 309
    .line 310
    invoke-direct {p0, p1, p3, p4, p5}, Lz1/c2;->V(Ljava/util/List;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 311
    .line 312
    .line 313
    return-void
.end method

.method private x0()V
    .locals 13

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 3
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    monitor-enter v2

    .line 4
    :try_start_0
    iget-object v3, p0, Lz1/c2;->l:Lz1/y0;

    iget-object v3, v3, Lz1/y0;->i:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher3/model/data/p;

    .line 5
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    move-result-object v5

    .line 6
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    const-string v6, "Item position overlap"

    invoke-virtual {v5, v4, v6}, Lz1/J3;->C(Ljava/util/Collection;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto/16 :goto_f

    .line 7
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    iget-object v3, p0, Lz1/c2;->l:Lz1/y0;

    monitor-enter v3

    .line 9
    :try_start_1
    iget-object v2, p0, Lz1/c2;->k:Lz1/m;

    iget-object v2, v2, Lz1/m;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher3/model/data/d;

    .line 10
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 11
    iget-object v8, v4, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 12
    iget-object v8, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-static {v7, v8}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    move-result-object v7

    .line 13
    invoke-static {v6}, Lcom/android/launcher3/util/P0;->r(I)Ljava/util/function/Predicate;

    move-result-object v8

    .line 14
    iget-object v9, p0, Lz1/c2;->l:Lz1/y0;

    iget-object v9, v9, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    invoke-interface {v9}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    move-result-object v9

    invoke-static {v9, v6}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    move-result-object v9

    .line 15
    invoke-interface {v9, v7}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v9

    .line 16
    invoke-interface {v9, v8}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v8

    .line 17
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Collection;

    .line 18
    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 19
    iget-object v8, v4, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    if-eqz v8, :cond_b

    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_b

    .line 20
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8, v5}, Ljava/util/HashSet;-><init>(I)V

    .line 21
    iget-object v9, v4, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 22
    iget-object v9, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-static {v8, v9}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    move-result-object v8

    .line 23
    iget-object v9, p0, Lz1/c2;->l:Lz1/y0;

    iget-object v9, v9, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    invoke-interface {v9}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    move-result-object v9

    invoke-static {v9, v6}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    move-result-object v9

    .line 24
    invoke-interface {v9, v8}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v8

    .line 25
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Collection;

    .line 26
    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/launcher3/model/data/y;

    .line 27
    iget v10, v9, Lcom/android/launcher3/model/data/y;->itemType:I

    if-nez v10, :cond_2

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v10

    if-nez v10, :cond_3

    goto :goto_2

    .line 28
    :cond_3
    iget v10, v9, Lcom/android/launcher3/model/data/y;->itemType:I

    if-nez v10, :cond_7

    .line 29
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v10

    if-eqz v10, :cond_7

    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 30
    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 31
    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v10

    iget-boolean v10, v10, Lcom/android/launcher3/r4;->a0:Z

    if-eqz v10, :cond_4

    const-class v10, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;

    .line 32
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    goto :goto_2

    :catchall_1
    move-exception p0

    goto/16 :goto_e

    .line 33
    :cond_4
    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v10

    iget-boolean v10, v10, Lcom/android/launcher3/r4;->i0:Z

    if-eqz v10, :cond_5

    const-class v10, Lcom/android/launcher3/settings/ConcernModeActivity;

    .line 34
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    goto :goto_2

    .line 35
    :cond_5
    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v10

    iget-boolean v10, v10, Lcom/android/launcher3/r4;->j0:Z

    if-eqz v10, :cond_6

    const-class v10, Lcom/android/launcher3/settings/StandardModeActivity;

    .line 36
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    goto/16 :goto_2

    .line 37
    :cond_6
    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v10

    iget-boolean v10, v10, Lcom/android/launcher3/r4;->k0:Z

    if-eqz v10, :cond_7

    const-class v10, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;

    .line 38
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    goto/16 :goto_2

    .line 39
    :cond_7
    iget v10, v9, Lcom/android/launcher3/model/data/y;->itemType:I

    if-nez v10, :cond_8

    .line 40
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v10

    if-eqz v10, :cond_8

    .line 41
    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-static {v10, v11}, Lx1/O;->s1(Landroid/content/Context;Landroid/content/ComponentName;)Z

    move-result v10

    if-eqz v10, :cond_8

    goto/16 :goto_2

    .line 42
    :cond_8
    iget-object v10, p0, Lz1/c2;->g:Landroid/content/Context;

    const-class v11, Landroid/content/pm/LauncherApps;

    .line 43
    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/pm/LauncherApps;

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v11

    iget-object v12, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    move-result-object v10

    .line 44
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_9
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/LauncherActivityInfo;

    .line 45
    invoke-virtual {v11}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    move-result-object v12

    if-eqz v12, :cond_9

    invoke-virtual {v11}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    goto/16 :goto_2

    .line 46
    :cond_a
    const-string v10, "LoaderTask"

    const-string v11, "verifyApplications not find Activity,delete it"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 48
    :cond_b
    invoke-static {v4}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 49
    const-string v8, "LoaderTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "verifyApplications: privateApp:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 50
    :cond_c
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    :goto_3
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 52
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    move-result-object v8

    iget-object v9, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    iget-object v10, v4, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    invoke-virtual {v10}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v5, v10}, Lcom/android/launcher3/globalsearch/s;->a(Landroid/os/UserHandle;I[Ljava/lang/String;)V

    .line 53
    :cond_d
    const-string v8, "LoaderTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Missing Application on load: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    :cond_e
    iget-object v4, p0, Lz1/c2;->l:Lz1/y0;

    iget-object v4, v4, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    invoke-interface {v4}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    move-result-object v4

    invoke-static {v4, v6}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    move-result-object v4

    .line 55
    invoke-interface {v4, v7}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v4

    .line 56
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    .line 57
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 58
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_f
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_10

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/launcher3/model/data/y;

    .line 59
    iget v9, v8, Lcom/android/launcher3/model/data/y;->itemType:I

    if-nez v9, :cond_f

    .line 60
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 61
    :cond_10
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v8, 0x2

    if-ne v4, v8, :cond_1

    .line 62
    new-instance v4, Lx1/O$a;

    invoke-direct {v4}, Lx1/O$a;-><init>()V

    .line 63
    invoke-static {v7, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 64
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_11
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_13

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/launcher3/model/data/y;

    .line 65
    iget v9, v8, Lcom/android/launcher3/model/data/y;->container:I

    if-lez v9, :cond_11

    .line 66
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 67
    iget-object v10, p0, Lz1/c2;->l:Lz1/y0;

    iget-object v10, v10, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    invoke-virtual {v10}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    move-result-object v10

    new-instance v11, Lz1/H1;

    invoke-direct {v11}, Lz1/H1;-><init>()V

    invoke-interface {v10, v11}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_12

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/launcher3/model/data/y;

    .line 68
    iget v11, v11, Lcom/android/launcher3/model/data/y;->id:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 69
    :cond_12
    iget v10, v8, Lcom/android/launcher3/model/data/y;->container:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_11

    goto :goto_6

    :cond_13
    const/4 v8, 0x0

    :goto_6
    if-eqz v8, :cond_14

    .line 70
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    if-ne v4, v5, :cond_14

    move v5, v6

    .line 71
    :cond_14
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 72
    iget-object v4, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    invoke-virtual {v4, v7}, Lcom/android/launcher3/D3;->R(Ljava/util/ArrayList;)V

    goto/16 :goto_1

    .line 73
    :cond_15
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 74
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_18

    .line 75
    invoke-direct {p0}, Lz1/c2;->c0()Z

    move-result v2

    .line 76
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    if-eqz v2, :cond_17

    .line 77
    new-instance v4, Lz1/I1;

    invoke-direct {v4}, Lz1/I1;-><init>()V

    .line 78
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v4

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    .line 79
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_16

    .line 80
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 81
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    goto :goto_7

    :cond_16
    move v2, v6

    .line 82
    :cond_17
    :goto_7
    const-string v4, "LoaderTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "verifyApplications--added.size()="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    iget-object v4, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    invoke-virtual {v4, v5}, Lcom/android/launcher3/D3;->V0(Z)V

    .line 84
    iget-object v4, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    new-instance v7, Lx1/O$b;

    invoke-direct {v7, v0}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v7}, Lx1/O$b;->b()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    if-eqz v2, :cond_18

    .line 85
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    new-instance v2, Lx1/O$b;

    invoke-direct {v2, v3}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v2}, Lx1/O$b;->b()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/android/launcher3/D3;->N(Ljava/util/List;)V

    .line 86
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "create_work_folder_prefs_key"

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 87
    :cond_18
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/H5;->W0()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 88
    iget-object v0, p0, Lz1/c2;->l:Lz1/y0;

    monitor-enter v0

    .line 89
    :try_start_2
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_19
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 90
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    move-result-object v4

    if-eqz v4, :cond_19

    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-nez v4, :cond_1a

    goto :goto_8

    .line 91
    :cond_1a
    :try_start_3
    iget-object v4, p0, Lz1/c2;->g:Landroid/content/Context;

    const-class v5, Landroid/content/pm/LauncherApps;

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/LauncherApps;

    .line 92
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v5

    iget-object v7, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 93
    invoke-virtual {v4, v5, v7}, Landroid/content/pm/LauncherApps;->isActivityEnabled(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    move-result v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_9

    :catchall_2
    move-exception p0

    goto :goto_a

    :catch_0
    move-exception v4

    .line 94
    :try_start_4
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    move v4, v6

    :goto_9
    if-nez v4, :cond_1b

    .line 95
    const-string v4, "LoaderTask"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "verifyApplications ATY not valid : "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 97
    :cond_1b
    iget-object v4, p0, Lz1/c2;->k:Lz1/m;

    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v5

    iget-object v7, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-virtual {v4, v5, v7}, Lz1/m;->m(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    move-result-object v4

    if-eqz v4, :cond_19

    .line 98
    iget-object v4, v4, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_19

    .line 99
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    const-string v4, "LoaderTask"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "loadWorkspace ATY changed : "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 101
    :cond_1c
    monitor-exit v0

    goto :goto_b

    :goto_a
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p0

    .line 102
    :cond_1d
    :goto_b
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_20

    .line 103
    const-string v0, "LoaderTask"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "verifyApplications--removed.size()="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 105
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 106
    iget-object v3, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashSet;

    if-nez v3, :cond_1e

    .line 107
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 108
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 109
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c

    .line 110
    :cond_1e
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 111
    :cond_1f
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/UserHandle;

    .line 112
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashSet;

    invoke-static {v3, v2}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    move-result-object v2

    .line 113
    iget-object v3, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    invoke-virtual {v3, v2}, Lcom/android/launcher3/D3;->P0(Ljava/util/function/Predicate;)V

    goto :goto_d

    .line 114
    :cond_20
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    move-result-object v0

    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    invoke-virtual {v0, p0}, Lcom/android/launcher3/H5;->U0(Landroid/content/Context;)V

    return-void

    .line 115
    :goto_e
    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p0

    .line 116
    :goto_f
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw p0
.end method

.method private y()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lz1/c2;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lz1/c2;->d0()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lx1/O;->L()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lz1/c2;->w(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-boolean v1, p0, Lz1/c2;->B:Z

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->I()V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget v0, p0, Lz1/c2;->H:I

    .line 37
    .line 38
    const-string v1, "restore_resize_layout"

    .line 39
    .line 40
    const/4 v2, -0x1

    .line 41
    const/4 v3, 0x0

    .line 42
    if-nez v0, :cond_5

    .line 43
    .line 44
    iget-boolean v0, p0, Lz1/c2;->B:Z

    .line 45
    .line 46
    if-nez v0, :cond_5

    .line 47
    .line 48
    const-string v0, "LoaderTask"

    .line 49
    .line 50
    const-string v4, "doPostLoadTaskRun: reset the value of show empty icon."

    .line 51
    .line 52
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    iput v2, p0, Lz1/c2;->H:I

    .line 56
    .line 57
    iput-boolean v3, p0, Lz1/c2;->G:Z

    .line 58
    .line 59
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v4, "need_show_empty_icon"

    .line 70
    .line 71
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 72
    .line 73
    .line 74
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 75
    .line 76
    .line 77
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 78
    .line 79
    .line 80
    iget-boolean v0, p0, Lz1/c2;->I:Z

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 86
    .line 87
    invoke-static {v0, v1}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 92
    .line 93
    invoke-static {v0, v3}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 94
    .line 95
    .line 96
    :goto_0
    iget-boolean v0, p0, Lz1/c2;->J:Z

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 101
    .line 102
    invoke-static {v0, v1}, Lx1/O;->v5(Landroid/content/Context;Z)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 107
    .line 108
    invoke-static {v0, v3}, Lx1/O;->v5(Landroid/content/Context;Z)V

    .line 109
    .line 110
    .line 111
    :goto_1
    iget-boolean v0, p0, Lz1/c2;->K:Z

    .line 112
    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 116
    .line 117
    invoke-static {p0, v1}, Lx1/O;->r5(Landroid/content/Context;Z)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 122
    .line 123
    invoke-static {p0, v3}, Lx1/O;->r5(Landroid/content/Context;Z)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    iget-boolean v0, p0, Lz1/c2;->G:Z

    .line 128
    .line 129
    if-eqz v0, :cond_6

    .line 130
    .line 131
    iget-boolean v0, p0, Lz1/c2;->B:Z

    .line 132
    .line 133
    if-nez v0, :cond_6

    .line 134
    .line 135
    iput-boolean v3, p0, Lz1/c2;->G:Z

    .line 136
    .line 137
    iget-object p0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 138
    .line 139
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 148
    .line 149
    .line 150
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 151
    .line 152
    .line 153
    :cond_6
    return-void
.end method

.method private declared-synchronized y0()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lz1/c2;->B:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/concurrent/CancellationException;

    .line 9
    .line 10
    const-string v1, "Loader stopped"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method private z()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "LoaderTask"

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->X()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->J()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->P()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->H()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v0, "doPreLoadTaskRun: other"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const-string v0, "doPreLoadTaskRun: launcher is null."

    .line 44
    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/b0;->l()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput-boolean v0, p0, Lz1/c2;->F:Z

    .line 67
    .line 68
    iget v0, p0, Lz1/c2;->H:I

    .line 69
    .line 70
    const/4 v2, -0x1

    .line 71
    if-eq v0, v2, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 74
    .line 75
    invoke-static {v0}, Lcom/android/launcher3/util/D1;->a(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/android/launcher3/util/D1;->j(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v2, "doPreLoadTaskRun mShouldResize: "

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-boolean v2, p0, Lz1/c2;->F:Z

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v2, " ,mNeedShowRestoredInfo: "

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget p0, p0, Lz1/c2;->H:I

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private z0()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/h1;->X()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "LoaderTask"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v3, "verifyPrivateApps size:"

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lz1/c2;->l:Lz1/y0;

    .line 32
    .line 33
    monitor-enter v1

    .line 34
    :try_start_0
    iget-object v2, p0, Lz1/c2;->l:Lz1/y0;

    .line 35
    .line 36
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Lz1/P1;

    .line 43
    .line 44
    invoke-direct {v3}, Lz1/P1;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 70
    .line 71
    move-object v4, v3

    .line 72
    check-cast v4, Lcom/android/launcher3/model/data/p;

    .line 73
    .line 74
    const/16 v5, 0x20

    .line 75
    .line 76
    invoke-virtual {v4, v5}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_0

    .line 81
    .line 82
    check-cast v3, Lcom/android/launcher3/model/data/p;

    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    goto :goto_0

    .line 86
    :catchall_0
    move-exception p0

    .line 87
    goto/16 :goto_4

    .line 88
    .line 89
    :cond_1
    const/4 v2, 0x0

    .line 90
    const/4 v3, 0x0

    .line 91
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_7

    .line 97
    .line 98
    if-nez v2, :cond_2

    .line 99
    .line 100
    new-instance v1, Lz1/Q1;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Lz1/Q1;-><init>(Lz1/c2;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Ljava/util/ArrayList;

    .line 118
    .line 119
    const-string v2, "LoaderTask"

    .line 120
    .line 121
    new-instance v3, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    const-string v4, "verifyPrivateApps has privateFolder! folderContents.size(): "

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    new-instance v2, Lz1/R1;

    .line 146
    .line 147
    invoke-direct {v2, p0, v1}, Lz1/R1;-><init>(Lz1/c2;Ljava/util/ArrayList;)V

    .line 148
    .line 149
    .line 150
    invoke-interface {v0, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 151
    .line 152
    .line 153
    new-instance v2, Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eqz v3, :cond_5

    .line 167
    .line 168
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 173
    .line 174
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    if-eqz v5, :cond_4

    .line 183
    .line 184
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    check-cast v5, Lcom/android/launcher3/resource/h1$h;

    .line 189
    .line 190
    iget-object v6, v5, Lcom/android/launcher3/resource/h1$h;->a:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v7

    .line 196
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v6

    .line 200
    if-eqz v6, :cond_3

    .line 201
    .line 202
    iget v5, v5, Lcom/android/launcher3/resource/h1$h;->b:I

    .line 203
    .line 204
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    iget-object v7, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 209
    .line 210
    invoke-virtual {v6, v7}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    if-ne v5, v6, :cond_3

    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_4
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_9

    .line 226
    .line 227
    const-string v0, "LoaderTask"

    .line 228
    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    const-string v3, "verifyPrivateApps showInfos.size(): "

    .line 235
    .line 236
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    :cond_6
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-eqz v1, :cond_9

    .line 262
    .line 263
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    if-eqz v2, :cond_6

    .line 274
    .line 275
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 276
    .line 277
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    iget-object v4, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 286
    .line 287
    invoke-virtual {v2, v3, v4}, Lz1/Q2;->onPackageRemoved(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 288
    .line 289
    .line 290
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 291
    .line 292
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 301
    .line 302
    invoke-virtual {v2, v3, v1}, Lz1/Q2;->onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 303
    .line 304
    .line 305
    goto :goto_2

    .line 306
    :cond_7
    if-eqz v2, :cond_9

    .line 307
    .line 308
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    const-string v1, "LoaderTask"

    .line 313
    .line 314
    new-instance v2, Ljava/lang/StringBuilder;

    .line 315
    .line 316
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 317
    .line 318
    .line 319
    const-string v3, "verifyPrivateApps hasPrivateFolder but no private app! contentSize: "

    .line 320
    .line 321
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    .line 337
    .line 338
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    :cond_8
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    if-eqz v1, :cond_9

    .line 347
    .line 348
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 353
    .line 354
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    if-eqz v2, :cond_8

    .line 359
    .line 360
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 361
    .line 362
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    iget-object v4, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 371
    .line 372
    invoke-virtual {v2, v3, v4}, Lz1/Q2;->onPackageRemoved(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 373
    .line 374
    .line 375
    iget-object v2, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 376
    .line 377
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 386
    .line 387
    invoke-virtual {v2, v3, v1}, Lz1/Q2;->onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 388
    .line 389
    .line 390
    goto :goto_3

    .line 391
    :cond_9
    return-void

    .line 392
    :goto_4
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    throw p0
.end method


# virtual methods
.method A(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;Ljava/util/List;Z)Lcom/android/launcher3/model/data/q;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/d;",
            "Landroid/content/pm/LauncherActivityInfo;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/I;",
            ">;>;Z)",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    if-eqz p4, :cond_2

    .line 9
    .line 10
    invoke-interface {p3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    new-instance p4, Lz1/L1;

    .line 15
    .line 16
    invoke-direct {p4, p1}, Lz1/L1;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p3, p4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-interface {p3}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p3}, Ljava/util/Optional;->isPresent()Z

    .line 28
    .line 29
    .line 30
    move-result p4

    .line 31
    const-string v0, "LoaderTask"

    .line 32
    .line 33
    if-eqz p4, :cond_1

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    iget-boolean p4, p4, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    .line 40
    .line 41
    if-eqz p4, :cond_1

    .line 42
    .line 43
    new-instance p4, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v2, "getAppInfoIconRequestInfo: matching archived info found, loading icon blob into icon request. Component="

    .line 49
    .line 50
    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    invoke-static {p4}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance p4, Lcom/android/launcher3/model/data/q;

    .line 68
    .line 69
    invoke-virtual {p3}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    check-cast p3, Lcom/android/launcher3/model/data/q;

    .line 74
    .line 75
    iget-object p3, p3, Lcom/android/launcher3/model/data/q;->c:[B

    .line 76
    .line 77
    invoke-direct {p4, p1, p2, p3, v1}, Lcom/android/launcher3/model/data/q;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;[BZ)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 81
    .line 82
    invoke-virtual {p4, p2}, Lcom/android/launcher3/model/data/q;->a(Landroid/content/Context;)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-nez p2, :cond_0

    .line 87
    .line 88
    const-string p2, "AppInfo Icon failed to load from blob, using cache."

    .line 89
    .line 90
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lz1/c2;->w:Ls1/P;

    .line 94
    .line 95
    iget-object p2, p4, Lcom/android/launcher3/model/data/q;->b:Landroid/content/pm/LauncherActivityInfo;

    .line 96
    .line 97
    sget-object p3, Lt1/g;->d:Lt1/g;

    .line 98
    .line 99
    invoke-virtual {p0, p1, p2, p3}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 100
    .line 101
    .line 102
    :cond_0
    return-object p4

    .line 103
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string p3, "App not archived or workspace info not found, creating IconRequestInfo without icon blob. Component:"

    .line 109
    .line 110
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p3, ", isArchived: "

    .line 121
    .line 122
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    iget-boolean p3, p3, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    .line 130
    .line 131
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    :cond_2
    new-instance p0, Lcom/android/launcher3/model/data/q;

    .line 142
    .line 143
    invoke-direct {p0, p1, p2, v1}, Lcom/android/launcher3/model/data/q;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Z)V

    .line 144
    .line 145
    .line 146
    return-object p0
.end method

.method protected declared-synchronized A0()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lz1/c2;->q:Lz1/O;

    .line 3
    .line 4
    invoke-virtual {v0, p0}, Lz1/O;->T(Ljava/lang/Object;)Lcom/android/launcher3/util/q1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :goto_0
    iget-boolean v1, p0, Lz1/c2;->B:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-wide/16 v1, 0x3e8

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/q1;->a(J)Z

    .line 15
    .line 16
    .line 17
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method public B()Lz1/m;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/c2;->k:Lz1/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public G()I
    .locals 0

    .line 1
    iget p0, p0, Lz1/c2;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public H()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lz1/c2;->M:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public J()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lz1/c2;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public q0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lz1/c2;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public r0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lz1/c2;->K:Z

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 11

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lz1/c2;->B:Z

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-static {}, Lx1/O;->A5()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/16 v0, 0xca

    .line 13
    .line 14
    invoke-static {v0}, Lx1/O;->A4(I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    move-object v2, p0

    .line 20
    goto/16 :goto_f

    .line 21
    .line 22
    :cond_0
    :goto_0
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    const-string v0, "LoaderTask"

    .line 26
    .line 27
    const-string v1, "LoaderTask.run"

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lx1/O;->z5()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const-string v0, "loaderTask"

    .line 39
    .line 40
    const/16 v1, 0xe

    .line 41
    .line 42
    const-wide/16 v2, 0xbb8

    .line 43
    .line 44
    invoke-static {v0, v1, v2, v3}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-static {}, Lx1/O;->A5()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/16 v0, 0xc9

    .line 55
    .line 56
    invoke-static {v0}, Lx1/O;->A4(I)V

    .line 57
    .line 58
    .line 59
    :cond_3
    :goto_1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 60
    .line 61
    const-string v1, "LoaderTask"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->c(I)V

    .line 70
    .line 71
    .line 72
    new-instance v6, Lz1/B1;

    .line 73
    .line 74
    invoke-direct {v6}, Lz1/B1;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget-object v8, Lcom/android/launcher3/J3;->r:Lcom/android/launcher3/X;

    .line 84
    .line 85
    invoke-virtual {v0, v8}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Ljava/lang/Boolean;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput-boolean v0, p0, Lz1/c2;->o:Z

    .line 96
    .line 97
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_4

    .line 102
    .line 103
    sget-object v0, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->Companion:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;

    .line 104
    .line 105
    iget-object v2, p0, Lz1/c2;->g:Landroid/content/Context;

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;->a(Landroid/content/Context;)Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    :goto_2
    move-object v7, v0

    .line 112
    goto :goto_3

    .line 113
    :cond_4
    const/4 v0, 0x0

    .line 114
    goto :goto_2

    .line 115
    :goto_3
    :try_start_1
    iget-object v0, p0, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 116
    .line 117
    invoke-virtual {v0, p0}, Lcom/android/launcher3/D3;->Q(Lz1/c2;)Lcom/android/launcher3/D3$c;

    .line 118
    .line 119
    .line 120
    move-result-object v9
    :try_end_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    .line 121
    :try_start_2
    invoke-direct {p0}, Lz1/c2;->z()V

    .line 122
    .line 123
    .line 124
    const-string v0, "doPreLoadTaskRun"

    .line 125
    .line 126
    invoke-static {v0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance v3, Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .line 133
    .line 134
    const-string v4, ""

    .line 135
    .line 136
    new-instance v5, Ljava/util/HashMap;

    .line 137
    .line 138
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 139
    .line 140
    .line 141
    move-object v2, p0

    .line 142
    :try_start_3
    invoke-direct/range {v2 .. v7}, Lz1/c2;->x(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Lz1/B1;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 143
    .line 144
    .line 145
    const-string p0, "launcher.db"

    .line 146
    .line 147
    iget-object v0, v2, Lz1/c2;->E:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_5

    .line 154
    .line 155
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 156
    .line 157
    .line 158
    iget-boolean p0, v2, Lz1/c2;->D:Z

    .line 159
    .line 160
    invoke-direct {v2, p0}, Lz1/c2;->m0(Z)V

    .line 161
    .line 162
    .line 163
    invoke-direct {v2}, Lz1/c2;->l0()V

    .line 164
    .line 165
    .line 166
    invoke-direct {v2}, Lz1/c2;->n0()V

    .line 167
    .line 168
    .line 169
    const-string p0, "sanitizeData finished"

    .line 170
    .line 171
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    goto :goto_5

    .line 175
    :catchall_1
    move-exception v0

    .line 176
    :goto_4
    move-object p0, v0

    .line 177
    goto/16 :goto_8

    .line 178
    .line 179
    :cond_5
    :goto_5
    iget-object p0, v2, Lz1/c2;->n:Lz1/m2;

    .line 180
    .line 181
    invoke-virtual {p0}, Lz1/m2;->l()V

    .line 182
    .line 183
    .line 184
    invoke-direct {v2}, Lz1/c2;->o0()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v2}, Lz1/c2;->A0()V

    .line 188
    .line 189
    .line 190
    const-string p0, "step 1 loading workspace complete"

    .line 191
    .line 192
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 196
    .line 197
    .line 198
    const-string p0, "LoadAllApps"

    .line 199
    .line 200
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 201
    .line 202
    .line 203
    :try_start_4
    invoke-direct {v2}, Lz1/c2;->U()Ljava/util/List;

    .line 204
    .line 205
    .line 206
    move-result-object p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 207
    :try_start_5
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 208
    .line 209
    .line 210
    const-string v0, "loadAllApps finished"

    .line 211
    .line 212
    invoke-static {v0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 216
    .line 217
    .line 218
    iget-object v0, v2, Lz1/c2;->q:Lz1/O;

    .line 219
    .line 220
    invoke-virtual {v0}, Lz1/O;->A()V

    .line 221
    .line 222
    .line 223
    const-string v0, "bindAllApps finished"

    .line 224
    .line 225
    invoke-static {v0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 229
    .line 230
    .line 231
    iget-object v0, v2, Lz1/c2;->w:Ls1/P;

    .line 232
    .line 233
    invoke-virtual {v0}, Lt1/f;->C()Lt1/n;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-direct {v2, v0}, Lz1/c2;->p0(Lt1/n;)V

    .line 238
    .line 239
    .line 240
    sget-object v4, Lt1/o;->a:Lt1/o;

    .line 241
    .line 242
    iget-object v5, v2, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 243
    .line 244
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    new-instance v10, Lz1/C1;

    .line 248
    .line 249
    invoke-direct {v10, v5}, Lz1/C1;-><init>(Lcom/android/launcher3/D3;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, p0, v4, v10}, Lt1/n;->k(Ljava/util/List;Lt1/j;Lt1/n$b;)V

    .line 253
    .line 254
    .line 255
    const-string v4, "update AllApps icon cache finished"

    .line 256
    .line 257
    invoke-static {v4}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 261
    .line 262
    .line 263
    const-string v4, "saving all shortcuts in icon cache"

    .line 264
    .line 265
    invoke-static {v4}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    sget-object v4, Ls1/g;->a:Ls1/g;

    .line 269
    .line 270
    iget-object v5, v2, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 271
    .line 272
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    new-instance v10, Lz1/C1;

    .line 276
    .line 277
    invoke-direct {v10, v5}, Lz1/C1;-><init>(Lcom/android/launcher3/D3;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0, v3, v4, v10}, Lt1/n;->k(Ljava/util/List;Lt1/j;Lt1/n$b;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v2}, Lz1/c2;->A0()V

    .line 284
    .line 285
    .line 286
    const-string v3, "step 2 loading AllApps complete"

    .line 287
    .line 288
    invoke-static {v3}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 292
    .line 293
    .line 294
    invoke-direct {v2}, Lz1/c2;->W()Ljava/util/List;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    const-string v5, "loadDeepShortcuts finished"

    .line 299
    .line 300
    invoke-static {v5}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 304
    .line 305
    .line 306
    iget-object v5, v2, Lz1/c2;->q:Lz1/O;

    .line 307
    .line 308
    invoke-virtual {v5}, Lz1/O;->C()V

    .line 309
    .line 310
    .line 311
    const-string v5, "bindDeepShortcuts finished"

    .line 312
    .line 313
    invoke-static {v5}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 317
    .line 318
    .line 319
    const-string v5, "saving deep shortcuts in icon cache"

    .line 320
    .line 321
    invoke-static {v5}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-static {v3, p0}, Ls1/h;->a(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    new-instance v3, Lz1/N1;

    .line 329
    .line 330
    invoke-direct {v3}, Lz1/N1;-><init>()V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v0, p0, v4, v3}, Lt1/n;->k(Ljava/util/List;Lt1/j;Lt1/n$b;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v2}, Lz1/c2;->A0()V

    .line 337
    .line 338
    .line 339
    const-string p0, "step 3 loading all shortcuts complete"

    .line 340
    .line 341
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 345
    .line 346
    .line 347
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 348
    .line 349
    .line 350
    move-result p0

    .line 351
    if-eqz p0, :cond_6

    .line 352
    .line 353
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/s;->c()V

    .line 362
    .line 363
    .line 364
    :cond_6
    iget-object p0, v2, Lz1/c2;->h:Lcom/android/launcher3/D3;

    .line 365
    .line 366
    new-instance v3, Lx1/x;

    .line 367
    .line 368
    new-instance v4, Lz1/U1;

    .line 369
    .line 370
    invoke-direct {v4, v2, v0}, Lz1/U1;-><init>(Lz1/c2;Lt1/n;)V

    .line 371
    .line 372
    .line 373
    invoke-direct {v3, v4, v1}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {p0, v3}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 377
    .line 378
    .line 379
    invoke-direct {v2}, Lz1/c2;->y0()V

    .line 380
    .line 381
    .line 382
    iget-object p0, v2, Lz1/c2;->n:Lz1/m2;

    .line 383
    .line 384
    invoke-virtual {p0}, Lz1/m2;->j()V

    .line 385
    .line 386
    .line 387
    const-string p0, "LoaderTask"

    .line 388
    .line 389
    const-string v0, "transaction.commit()"

    .line 390
    .line 391
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    .line 393
    .line 394
    invoke-virtual {v9}, Lcom/android/launcher3/D3$c;->b()V

    .line 395
    .line 396
    .line 397
    invoke-virtual {v6}, Lz1/B1;->b()V

    .line 398
    .line 399
    .line 400
    iget-boolean p0, v2, Lz1/c2;->o:Z

    .line 401
    .line 402
    if-eqz p0, :cond_7

    .line 403
    .line 404
    const/4 p0, 0x0

    .line 405
    iput-boolean p0, v2, Lz1/c2;->o:Z

    .line 406
    .line 407
    iget-object p0, v2, Lz1/c2;->g:Landroid/content/Context;

    .line 408
    .line 409
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 414
    .line 415
    invoke-virtual {v8, v0}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    filled-new-array {v0}, [Lh4/l;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->u([Lh4/l;)V

    .line 424
    .line 425
    .line 426
    if-eqz v7, :cond_7

    .line 427
    .line 428
    invoke-virtual {v7}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->reportLauncherRestoreResults()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 429
    .line 430
    .line 431
    :cond_7
    :try_start_6
    invoke-virtual {v9}, Lcom/android/launcher3/D3$c;->close()V
    :try_end_6
    .catch Ljava/util/concurrent/CancellationException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 432
    .line 433
    .line 434
    invoke-direct {v2}, Lz1/c2;->y()V

    .line 435
    .line 436
    .line 437
    new-instance p0, Ljava/lang/StringBuilder;

    .line 438
    .line 439
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 440
    .line 441
    .line 442
    const-string v0, "doPostLoadTaskRun mStopped="

    .line 443
    .line 444
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    iget-boolean v0, v2, Lz1/c2;->B:Z

    .line 448
    .line 449
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object p0

    .line 456
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    iget-boolean p0, v2, Lz1/c2;->B:Z

    .line 460
    .line 461
    if-nez p0, :cond_9

    .line 462
    .line 463
    :try_start_7
    iget-object p0, v2, Lz1/c2;->q:Lz1/O;

    .line 464
    .line 465
    invoke-virtual {p0}, Lz1/O;->z()V

    .line 466
    .line 467
    .line 468
    const-string p0, "bindAIFutureScreen finished"

    .line 469
    .line 470
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 471
    .line 472
    .line 473
    goto/16 :goto_c

    .line 474
    .line 475
    :catchall_2
    move-exception v0

    .line 476
    move-object p0, v0

    .line 477
    const-string v0, "LoaderTask"

    .line 478
    .line 479
    const-string v2, "LoaderTask run bindAIFutureScreen error"

    .line 480
    .line 481
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 482
    .line 483
    .line 484
    goto :goto_c

    .line 485
    :catchall_3
    move-exception v0

    .line 486
    :goto_6
    move-object p0, v0

    .line 487
    goto :goto_d

    .line 488
    :catch_0
    move-exception v0

    .line 489
    :goto_7
    move-object p0, v0

    .line 490
    goto :goto_a

    .line 491
    :catchall_4
    move-exception v0

    .line 492
    move-object p0, v0

    .line 493
    :try_start_8
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 494
    .line 495
    .line 496
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 497
    :catchall_5
    move-exception v0

    .line 498
    move-object v2, p0

    .line 499
    goto/16 :goto_4

    .line 500
    .line 501
    :goto_8
    if-eqz v9, :cond_8

    .line 502
    .line 503
    :try_start_9
    invoke-virtual {v9}, Lcom/android/launcher3/D3$c;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 504
    .line 505
    .line 506
    goto :goto_9

    .line 507
    :catchall_6
    move-exception v0

    .line 508
    :try_start_a
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 509
    .line 510
    .line 511
    :cond_8
    :goto_9
    throw p0
    :try_end_a
    .catch Ljava/util/concurrent/CancellationException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 512
    :catchall_7
    move-exception v0

    .line 513
    move-object v2, p0

    .line 514
    goto :goto_6

    .line 515
    :catch_1
    move-exception v0

    .line 516
    move-object v2, p0

    .line 517
    goto :goto_7

    .line 518
    :catch_2
    move-object v2, p0

    .line 519
    goto :goto_b

    .line 520
    :goto_a
    :try_start_b
    invoke-virtual {v6}, Lz1/B1;->c()V

    .line 521
    .line 522
    .line 523
    throw p0

    .line 524
    :catch_3
    :goto_b
    const-string p0, "LoaderTask"

    .line 525
    .line 526
    const-string v0, "LoaderTask cancelled"

    .line 527
    .line 528
    invoke-static {p0, v0}, Lcom/android/launcher3/logging/b;->o(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 529
    .line 530
    .line 531
    invoke-direct {v2}, Lz1/c2;->y()V

    .line 532
    .line 533
    .line 534
    new-instance p0, Ljava/lang/StringBuilder;

    .line 535
    .line 536
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 537
    .line 538
    .line 539
    const-string v0, "doPostLoadTaskRun mStopped="

    .line 540
    .line 541
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    iget-boolean v0, v2, Lz1/c2;->B:Z

    .line 545
    .line 546
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object p0

    .line 553
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    iget-boolean p0, v2, Lz1/c2;->B:Z

    .line 557
    .line 558
    if-nez p0, :cond_9

    .line 559
    .line 560
    :try_start_c
    iget-object p0, v2, Lz1/c2;->q:Lz1/O;

    .line 561
    .line 562
    invoke-virtual {p0}, Lz1/O;->z()V

    .line 563
    .line 564
    .line 565
    const-string p0, "bindAIFutureScreen finished"

    .line 566
    .line 567
    invoke-static {p0}, Lz1/c2;->b0(Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 568
    .line 569
    .line 570
    :cond_9
    :goto_c
    sget-object p0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 571
    .line 572
    invoke-virtual {p0, v1}, Lcom/android/launcher3/util/p1;->t(I)V

    .line 573
    .line 574
    .line 575
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 576
    .line 577
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 578
    .line 579
    .line 580
    return-void

    .line 581
    :goto_d
    invoke-direct {v2}, Lz1/c2;->y()V

    .line 582
    .line 583
    .line 584
    new-instance v0, Ljava/lang/StringBuilder;

    .line 585
    .line 586
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 587
    .line 588
    .line 589
    const-string v1, "doPostLoadTaskRun mStopped="

    .line 590
    .line 591
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    iget-boolean v1, v2, Lz1/c2;->B:Z

    .line 595
    .line 596
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-static {v0}, Lz1/c2;->b0(Ljava/lang/String;)V

    .line 604
    .line 605
    .line 606
    iget-boolean v0, v2, Lz1/c2;->B:Z

    .line 607
    .line 608
    if-nez v0, :cond_a

    .line 609
    .line 610
    :try_start_d
    iget-object v0, v2, Lz1/c2;->q:Lz1/O;

    .line 611
    .line 612
    invoke-virtual {v0}, Lz1/O;->z()V

    .line 613
    .line 614
    .line 615
    const-string v0, "bindAIFutureScreen finished"

    .line 616
    .line 617
    invoke-static {v0}, Lz1/c2;->b0(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    .line 618
    .line 619
    .line 620
    goto :goto_e

    .line 621
    :catchall_8
    move-exception v0

    .line 622
    const-string v1, "LoaderTask"

    .line 623
    .line 624
    const-string v2, "LoaderTask run bindAIFutureScreen error"

    .line 625
    .line 626
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 627
    .line 628
    .line 629
    :cond_a
    :goto_e
    throw p0

    .line 630
    :goto_f
    :try_start_e
    monitor-exit v2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    .line 631
    throw v0

    .line 632
    :catchall_9
    move-exception v0

    .line 633
    goto :goto_f
.end method

.method public s0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lz1/c2;->J:Z

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized t0()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "LoaderTask"

    .line 3
    .line 4
    const-string v1, "stopLocked: Loader stopping"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/android/launcher3/logging/b;->o(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lz1/c2;->B:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public w0(Landroid/content/ComponentName;Lz1/y1;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-static/range {p1 .. p1}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    const-string v2, "container"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v1, v2}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const-string v3, "spanX"

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 28
    .line 29
    .line 30
    move-result v10

    .line 31
    const-string v3, "spanY"

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 38
    .line 39
    .line 40
    move-result v11

    .line 41
    const-string v3, "itemType"

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 48
    .line 49
    .line 50
    move-result v12

    .line 51
    if-lez v2, :cond_0

    .line 52
    .line 53
    new-instance v4, Lcom/android/launcher3/H5$a;

    .line 54
    .line 55
    int-to-long v8, v2

    .line 56
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 57
    .line 58
    .line 59
    move-result-object v13

    .line 60
    iget-object v15, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    const/4 v6, 0x0

    .line 64
    const/4 v7, 0x0

    .line 65
    move-object/from16 v14, p1

    .line 66
    .line 67
    invoke-direct/range {v4 .. v15}, Lcom/android/launcher3/H5$a;-><init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const-string v3, "screen"

    .line 72
    .line 73
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    invoke-virtual {v1, v3}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    int-to-long v3, v3

    .line 82
    const-string v5, "cellX"

    .line 83
    .line 84
    invoke-virtual {v1, v5}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    invoke-virtual {v1, v5}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    const-string v6, "cellY"

    .line 93
    .line 94
    invoke-virtual {v1, v6}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    invoke-virtual {v1, v6}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    new-instance v1, Lcom/android/launcher3/H5$a;

    .line 103
    .line 104
    long-to-int v7, v3

    .line 105
    int-to-long v8, v2

    .line 106
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 107
    .line 108
    .line 109
    move-result-object v13

    .line 110
    iget-object v15, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 111
    .line 112
    move-object/from16 v14, p1

    .line 113
    .line 114
    move-object v4, v1

    .line 115
    invoke-direct/range {v4 .. v15}, Lcom/android/launcher3/H5$a;-><init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V

    .line 116
    .line 117
    .line 118
    :goto_0
    iget-object v0, v0, Lz1/c2;->g:Landroid/content/Context;

    .line 119
    .line 120
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0, v4}, Lcom/android/launcher3/H5;->k1(Lcom/android/launcher3/H5$a;)V

    .line 129
    .line 130
    .line 131
    :cond_1
    return-void
.end method
