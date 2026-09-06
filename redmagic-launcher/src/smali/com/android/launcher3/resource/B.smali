.class public Lcom/android/launcher3/resource/B;
.super Ljava/lang/Object;
.source "LayoutDataSelector.java"


# static fields
.field public static k:Ljava/lang/String;

.field public static final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/lang/Boolean;

.field private c:Ljava/lang/Boolean;

.field private d:Ljava/lang/Boolean;

.field private e:Ljava/lang/Boolean;

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->E()Lcom/android/launcher3/H5$d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5$d;->d()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lcom/android/launcher3/resource/B;->k:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "com.android.launcher3.prefs.streamer"

    .line 12
    .line 13
    const-string v1, "com.android.launcher3.prefs.concise"

    .line 14
    .line 15
    const-string v2, "com.android.launcher3.prefs"

    .line 16
    .line 17
    const-string v3, "com.android.launcher3.prefs.ease"

    .line 18
    .line 19
    const-string v4, "com.android.launcher3.prefs.double"

    .line 20
    .line 21
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/android/launcher3/resource/B;->l:Ljava/util/List;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->e:Ljava/lang/Boolean;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->f:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->g:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->h:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->i:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->j:Z

    .line 23
    .line 24
    return-void
.end method

.method private synthetic B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/MainProcessInitializer;->initialize(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {v0}, Ld1/c;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private J()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lz1/k2;->j0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private L()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, LR0/m;->d()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Lcom/android/launcher3/S3;->i()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/W2;->c()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->O()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "NORMAL_EASE_EMPTY_DATABASE_CREATED"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string p0, "STREAMER_EMPTY_DATABASE_CREATED"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const-string p0, "CONCISE_EMPTY_DATABASE_CREATED"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const-string p0, "EMPTY_DATABASE_CREATED"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "DOUBLE_EMPTY_DATABASE_CREATED"

    .line 41
    .line 42
    return-object p0
.end method

.method private l()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "MiFavor_settings.ease"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string p0, "MiFavor_settings.streamer"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const-string p0, "MiFavor_settings.concise"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const-string p0, "MiFavor_settings"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "MiFavor_settings.double"

    .line 41
    .line 42
    return-object p0
.end method

.method private m()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "easeWorkspaceScreens"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string p0, "streamerWorkspaceScreens"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const-string p0, "conciseWorkspaceScreens"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const-string p0, "workspaceScreens"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "doubleWorkspaceScreens"

    .line 41
    .line 42
    return-object p0
.end method

.method public static n(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "MiFavor_settings"

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    sparse-switch v2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v2, "easeFavorites"

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x3

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v2, "doubleFavorites"

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v1, 0x2

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v2, "streamerFavorites"

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v1, 0x1

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string v2, "favorites"

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v1, 0x0

    .line 58
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    const-string p0, "R-Loader"

    .line 62
    .line 63
    const-string v1, "getSettingsPrefs: dbName wrong, use NORMAL_MIFAVOR_SETTING_SHARE_PRERENCE"

    .line 64
    .line 65
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :pswitch_0
    const-string p0, "MiFavor_settings.ease"

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_1
    const-string p0, "MiFavor_settings.double"

    .line 73
    .line 74
    return-object p0

    .line 75
    :pswitch_2
    const-string p0, "MiFavor_settings.streamer"

    .line 76
    .line 77
    return-object p0

    .line 78
    :pswitch_3
    return-object v0

    .line 79
    :sswitch_data_0
    .sparse-switch
        -0x6a6895a9 -> :sswitch_3
        -0x33218f56 -> :sswitch_2
        0x3b41c986 -> :sswitch_1
        0x54c0b209 -> :sswitch_0
    .end sparse-switch

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 13
    .line 14
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    move-object v0, v1

    .line 31
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_1

    .line 48
    :cond_4
    move-object v0, v1

    .line 49
    :goto_1
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 50
    .line 51
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 52
    .line 53
    if-eqz v0, :cond_6

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :cond_6
    iput-object v1, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 60
    .line 61
    if-eqz v1, :cond_7

    .line 62
    .line 63
    new-instance v0, Lcom/android/launcher3/resource/A;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/A;-><init>(Lcom/android/launcher3/resource/B;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 73
    .line 74
    const-string v0, "Initializing LayoutDataSelector ctx failed !!!!"

    .line 75
    .line 76
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/B;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public C(Landroid/content/Context;ZZZZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeRestoreTarget targetEaseMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " targetSingleMode: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, " targetStreamerMode: "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " targetConciseMode: "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "R-Loader"

    .line 43
    .line 44
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 48
    .line 49
    .line 50
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iput-object p2, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iput-object p2, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    iput-object p2, p0, Lcom/android/launcher3/resource/B;->e:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->L()V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2}, Lz1/k2;->j()V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 95
    .line 96
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    const-string p3, "need_show_empty_icon"

    .line 105
    .line 106
    invoke-interface {p2, p3, p6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 107
    .line 108
    .line 109
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 110
    .line 111
    .line 112
    if-eqz p1, :cond_0

    .line 113
    .line 114
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const/4 p2, 0x0

    .line 123
    invoke-virtual {p1, p2}, Lcom/android/launcher3/H5;->o(LN1/e;)V

    .line 124
    .line 125
    .line 126
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->J()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/B;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public E(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/B;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public F(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/B;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public G(ZZZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setRestoreTarget targetEaseMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " targetSingleMode: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, " targetStreamerMode: "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "R-Loader"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x1

    .line 49
    if-eq p1, v0, :cond_0

    .line 50
    .line 51
    iput-boolean v1, p0, Lcom/android/launcher3/resource/B;->f:Z

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/android/launcher3/resource/B;->g:Z

    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eq p2, v0, :cond_1

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/android/launcher3/resource/B;->f:Z

    .line 64
    .line 65
    iput-boolean v1, p0, Lcom/android/launcher3/resource/B;->h:Z

    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eq p3, v0, :cond_2

    .line 74
    .line 75
    iput-boolean v1, p0, Lcom/android/launcher3/resource/B;->f:Z

    .line 76
    .line 77
    invoke-virtual {p0, p3}, Lcom/android/launcher3/resource/B;->f(Z)V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 85
    .line 86
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 91
    .line 92
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->L()V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/B;->g(Landroid/content/Context;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1}, Lz1/k2;->j()V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 118
    .line 119
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-string p2, "need_show_empty_icon"

    .line 128
    .line 129
    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 130
    .line 131
    .line 132
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 136
    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    const/4 p2, 0x0

    .line 148
    invoke-virtual {p1, p2}, Lcom/android/launcher3/H5;->o(LN1/e;)V

    .line 149
    .line 150
    .line 151
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->J()V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public H(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/B;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/B;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->L()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeConciseMode targetConciseMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->j:Z

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iput-object v2, p0, Lcom/android/launcher3/resource/B;->e:Ljava/lang/Boolean;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->h1()V

    .line 43
    .line 44
    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    new-instance p1, Landroid/content/Intent;

    .line 48
    .line 49
    const-string v2, "com.zte.halo.app.destroy.process"

    .line 50
    .line 51
    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const-string v2, "com.zte.halo.app"

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 60
    .line 61
    invoke-virtual {v2, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catch_0
    move-exception p1

    .line 66
    const-string v2, "changeConciseMode exitAssistant: "

    .line 67
    .line 68
    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 69
    .line 70
    .line 71
    :cond_0
    :goto_0
    const-string p1, "changeConciseMode: save showConciseAssistantOnce true!"

    .line 72
    .line 73
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string p1, "showConciseAssistantOnce"

    .line 87
    .line 88
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeEaseMode targetEaseMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->g:Z

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "changeHomeLayout"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->L()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/resource/Q;->x()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->J()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeSingleLayer targetSingleMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->h:Z

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeStreamerMode targetStreamerMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/resource/B;->i:Z

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Lcom/android/launcher3/H5;->j1(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public g(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->f1(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string p0, "com.zte.heartyservice"

    .line 20
    .line 21
    invoke-static {p1, p0}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const-string p0, "help_push_aside"

    .line 28
    .line 29
    invoke-static {p1, p0}, Lcom/android/launcher3/helper/a;->n(Landroid/content/Context;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const-string p0, "help_flash_notification"

    .line 40
    .line 41
    invoke-static {p1, p0}, Lcom/android/launcher3/helper/a;->n(Landroid/content/Context;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string p0, "help_style_editing"

    .line 45
    .line 46
    invoke-static {p1, p0}, Lcom/android/launcher3/helper/a;->n(Landroid/content/Context;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    const-string p0, "help_swipe_up"

    .line 51
    .line 52
    invoke-static {p1, p0}, Lcom/android/launcher3/helper/a;->n(Landroid/content/Context;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p0, "R-Loader"

    .line 56
    .line 57
    const-string p1, "clearState other"

    .line 58
    .line 59
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public h()Lcom/android/launcher3/H5$d;
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/H5$d;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->j()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->m()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->i()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->k()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->l()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/H5$d;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public j()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "easeFavorites"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string p0, "streamerFavorites"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const-string p0, "conciseFavorites"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const-string p0, "favorites"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "doubleFavorites"

    .line 41
    .line 42
    return-object p0
.end method

.method public k()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "com.android.launcher3.prefs.ease"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string p0, "com.android.launcher3.prefs.streamer"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const-string p0, "com.android.launcher3.prefs.concise"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const-string p0, "com.android.launcher3.prefs"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "com.android.launcher3.prefs.double"

    .line 41
    .line 42
    return-object p0
.end method

.method public p()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->e:Ljava/lang/Boolean;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->x0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->e:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/B;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/B;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public s()Z
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const-string v1, "R-Loader"

    .line 14
    .line 15
    if-nez v0, :cond_4

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v2, "ease_mode"

    .line 24
    .line 25
    const/4 v3, -0x1

    .line 26
    invoke-static {v0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v2, 0x1

    .line 31
    const/4 v4, 0x0

    .line 32
    if-ne v0, v3, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 35
    .line 36
    const-string v3, "config_default_home_layout"

    .line 37
    .line 38
    invoke-static {v0, v3, v4}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v3, 0x2

    .line 43
    if-ne v0, v3, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move v2, v4

    .line 47
    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v2, "isEaseMode: from launcherResource"

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_2
    if-ne v0, v2, :cond_3

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    move v2, v4

    .line 80
    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 85
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v2, "isEaseMode: from setting"

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    :cond_4
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v2, "isEaseMode: "

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v2, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->b:Ljava/lang/Boolean;

    .line 131
    .line 132
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/B;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->i3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "feature_mode"

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-static {p0, v0, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 v0, 0x1

    .line 26
    if-ne p0, v0, :cond_1

    .line 27
    .line 28
    return v0

    .line 29
    :cond_1
    return v1
.end method

.method public v()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public x()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->c:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/B;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public z()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/B;->o()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->p1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/resource/B;->a:Landroid/content/Context;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 40
    .line 41
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/resource/B;->d:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method
