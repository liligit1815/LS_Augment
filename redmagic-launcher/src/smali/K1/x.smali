.class public LK1/x;
.super Ljava/lang/Object;
.source "ZenForbidBadgeDialog.java"


# static fields
.field private static b:LK1/x;


# instance fields
.field private a:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(LK1/x;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LK1/x;->g(Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LK1/x;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LK1/x;->i(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LK1/x;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LK1/x;->h(Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f()LK1/x;
    .locals 2

    .line 1
    const-class v0, LK1/x;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, LK1/x;->b:LK1/x;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, LK1/x;

    .line 9
    .line 10
    invoke-direct {v1}, LK1/x;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, LK1/x;->b:LK1/x;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, LK1/x;->b:LK1/x;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v1
.end method

.method private synthetic g(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/x;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/x;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/x;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j()V
    .locals 0

    .line 1
    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "ZenForbidBadgeDialog"

    .line 8
    .line 9
    const-string v0, "onDismiss: fail, because no launcher instance!!!"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, LK1/x;->d()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    sget-object p0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 25
    .line 26
    invoke-interface {v0, p0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-static {v0}, Lx1/O;->o5(Lcom/android/launcher3/C2;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method private l()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "ZenForbidBadgeDialog"

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "onGoSettingsClick: fail, because no launcher instance!!!"

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    .line 16
    .line 17
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "android.settings.ZEN_MODE_SETTINGS"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    const/high16 v2, 0x10000000

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "com.android.settings"

    .line 31
    .line 32
    const-string v3, "com.android.settings.Settings$ZenModeSettingsActivity"

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception p0

    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v2, "onGoSettingsClick: "

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    const-string v0, "ZenForbidBadgeDialog"

    .line 2
    .line 3
    const-string v1, "clearAlertDialog: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public e(Landroid/content/Context;Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    if-eqz p2, :cond_3

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_1
    :try_start_0
    new-instance v0, Lx1/e;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    const v3, 0x7f0e00c4

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v3, v2, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const v1, 0x7f140480

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lx1/e;->n(I)Lx1/e;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, LK1/u;

    .line 56
    .line 57
    invoke-direct {v0, p0}, LK1/u;-><init>(LK1/x;)V

    .line 58
    .line 59
    .line 60
    const v1, 0x7f1400f7

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v1, v0}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, LK1/v;

    .line 68
    .line 69
    invoke-direct {v0, p0}, LK1/v;-><init>(LK1/x;)V

    .line 70
    .line 71
    .line 72
    const v1, 0x7f14036e

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v1, v0}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lx1/e;->a()Landroid/app/Dialog;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 84
    .line 85
    new-instance v0, LK1/w;

    .line 86
    .line 87
    invoke-direct {v0, p0}, LK1/w;-><init>(LK1/x;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object p2, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Lcom/android/launcher3/u4;->c(Landroid/content/DialogInterface;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object p1, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, LK1/x;->a:Landroid/app/Dialog;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    if-eqz p0, :cond_3

    .line 120
    .line 121
    const/high16 p1, -0x80000000

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Landroid/view/Window;->addFlags(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :catch_0
    move-exception p0

    .line 128
    new-instance p1, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string p2, "createZenForbidBadgeDialog: "

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    const-string p1, "ZenForbidBadgeDialog"

    .line 150
    .line 151
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    :cond_3
    :goto_0
    return-void
.end method
