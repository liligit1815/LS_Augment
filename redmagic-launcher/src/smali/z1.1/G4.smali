.class public Lz1/G4;
.super Ljava/lang/Object;
.source "StringCache.java"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lz1/G4;Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/G4;->h(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Landroid/content/Context;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private d(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean p0, Lcom/android/launcher3/N5;->g:Z

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const-class p0, Landroid/app/admin/DevicePolicyManager;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getManagedSubscriptionsPolicy()Landroid/app/admin/ManagedSubscriptionsPolicy;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/app/admin/ManagedSubscriptionsPolicy;->getPolicyType()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x1

    .line 22
    if-ne p0, v0, :cond_0

    .line 23
    .line 24
    const p0, 0x7f14049e

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const p0, 0x7f14049d

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    const p0, 0x7f14049a

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method private e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/F4;

    .line 2
    .line 3
    invoke-direct {v0, p1, p3}, Lz1/F4;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v0}, Lz1/G4;->f(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private f(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lcom/android/launcher3/N5;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lz1/G4;->g(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p3}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method private g(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    const-class p0, Landroid/app/admin/DevicePolicyManager;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getResources()Landroid/app/admin/DevicePolicyResourcesManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p2, p3}, Landroid/app/admin/DevicePolicyResourcesManager;->getString(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private synthetic h(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/G4;->d(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public c()Lz1/G4;
    .locals 2

    .line 1
    new-instance v0, Lz1/G4;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/G4;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/G4;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lz1/G4;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lz1/G4;->b:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lz1/G4;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lz1/G4;->c:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lz1/G4;->c:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lz1/G4;->d:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lz1/G4;->d:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lz1/G4;->e:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lz1/G4;->e:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lz1/G4;->f:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lz1/G4;->f:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lz1/G4;->g:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lz1/G4;->g:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lz1/G4;->h:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lz1/G4;->h:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lz1/G4;->i:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lz1/G4;->i:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lz1/G4;->j:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lz1/G4;->j:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lz1/G4;->k:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lz1/G4;->k:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lz1/G4;->l:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lz1/G4;->l:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lz1/G4;->m:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lz1/G4;->m:Ljava/lang/String;

    .line 57
    .line 58
    iget-object p0, p0, Lz1/G4;->n:Ljava/lang/String;

    .line 59
    .line 60
    iput-object p0, v0, Lz1/G4;->n:Ljava/lang/String;

    .line 61
    .line 62
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lz1/G4;->c()Lz1/G4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "Launcher.WORK_PROFILE_EDU"

    .line 2
    .line 3
    const v1, 0x7f1404a3

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lz1/G4;->a:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "Launcher.WORK_PROFILE_EDU_ACCEPT"

    .line 13
    .line 14
    const v1, 0x7f1404a1

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lz1/G4;->b:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "Launcher.WORK_PROFILE_PAUSED_TITLE"

    .line 24
    .line 25
    const v1, 0x7f14049f

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lz1/G4;->c:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v0, Lz1/E4;

    .line 35
    .line 36
    invoke-direct {v0, p0, p1}, Lz1/E4;-><init>(Lz1/G4;Landroid/content/Context;)V

    .line 37
    .line 38
    .line 39
    const-string v1, "Launcher.WORK_PROFILE_PAUSED_DESCRIPTION"

    .line 40
    .line 41
    invoke-direct {p0, p1, v1, v0}, Lz1/G4;->f(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lz1/G4;->d:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "Launcher.WORK_PROFILE_PAUSE_BUTTON"

    .line 48
    .line 49
    const v1, 0x7f140499

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lz1/G4;->e:Ljava/lang/String;

    .line 57
    .line 58
    const-string v0, "Launcher.WORK_PROFILE_ENABLE_BUTTON"

    .line 59
    .line 60
    const v1, 0x7f140498

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lz1/G4;->f:Ljava/lang/String;

    .line 68
    .line 69
    const-string v0, "Launcher.ALL_APPS_WORK_TAB"

    .line 70
    .line 71
    const v1, 0x7f140078

    .line 72
    .line 73
    .line 74
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lz1/G4;->g:Ljava/lang/String;

    .line 79
    .line 80
    const-string v0, "Launcher.ALL_APPS_PERSONAL_TAB"

    .line 81
    .line 82
    const v1, 0x7f140071

    .line 83
    .line 84
    .line 85
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lz1/G4;->h:Ljava/lang/String;

    .line 90
    .line 91
    const-string v0, "Launcher.ALL_APPS_WORK_TAB_ACCESSIBILITY"

    .line 92
    .line 93
    const v1, 0x7f14006c

    .line 94
    .line 95
    .line 96
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lz1/G4;->i:Ljava/lang/String;

    .line 101
    .line 102
    const-string v0, "Launcher.ALL_APPS_PERSONAL_TAB_ACCESSIBILITY"

    .line 103
    .line 104
    const v1, 0x7f14006b

    .line 105
    .line 106
    .line 107
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lz1/G4;->j:Ljava/lang/String;

    .line 112
    .line 113
    const-string v0, "Launcher.WORK_FOLDER_NAME"

    .line 114
    .line 115
    const v1, 0x7f1404a0

    .line 116
    .line 117
    .line 118
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lz1/G4;->k:Ljava/lang/String;

    .line 123
    .line 124
    const-string v0, "Launcher.WIDGETS_WORK_TAB"

    .line 125
    .line 126
    const v1, 0x7f140492

    .line 127
    .line 128
    .line 129
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lz1/G4;->l:Ljava/lang/String;

    .line 134
    .line 135
    const-string v0, "Launcher.WIDGETS_PERSONAL_TAB"

    .line 136
    .line 137
    const v1, 0x7f140490

    .line 138
    .line 139
    .line 140
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lz1/G4;->m:Ljava/lang/String;

    .line 145
    .line 146
    const-string v0, "Launcher.DISABLED_BY_ADMIN_MESSAGE"

    .line 147
    .line 148
    const v1, 0x7f14027b

    .line 149
    .line 150
    .line 151
    invoke-direct {p0, p1, v0, v1}, Lz1/G4;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iput-object p1, p0, Lz1/G4;->n:Ljava/lang/String;

    .line 156
    .line 157
    return-void
.end method
