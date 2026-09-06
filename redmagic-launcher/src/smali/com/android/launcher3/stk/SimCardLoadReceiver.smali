.class public Lcom/android/launcher3/stk/SimCardLoadReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SimCardLoadReceiver.java"


# static fields
.field private static a:Ljava/lang/String; = ""

.field private static b:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LR1/i;",
            ">;"
        }
    .end annotation
.end field

.field private static c:Landroid/app/IZswGeneralManager; = null

.field private static d:Lcom/android/launcher3/util/p2$a; = null

.field private static e:Z = false

.field private static f:Z = false

.field private static g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->g:Ljava/util/List;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/stk/SimCardLoadReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->k(Landroid/content/Context;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/stk/SimCardLoadReceiver;Lcom/android/launcher3/util/p2;Landroid/net/Uri;Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->j(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Landroid/content/Context;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    :cond_1
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_2
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private d(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->h(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "android.intent.action.BOOT_COMPLETED"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, "ril.radio.sim.operator"

    .line 15
    .line 16
    const-string v3, "SimCardLoadReceiver"

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    new-instance p2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "allowedSecondaryDeformation onReceive boot complete: "

    .line 26
    .line 27
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {v3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sput-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    const-string v0, "allowedSecondaryDeformation received simCard changed broadcast"

    .line 59
    .line 60
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    const-string v0, "ss"

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v1, "allowedSecondaryDeformation simStatus = "

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    const-string v0, "ABSENT"

    .line 92
    .line 93
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sput-object v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 104
    .line 105
    const-string v0, "allowedSecondaryDeformation unplug the card"

    .line 106
    .line 107
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    :cond_1
    const-string v0, "LOADED"

    .line 111
    .line 112
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_2

    .line 117
    .line 118
    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    sput-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 123
    .line 124
    const-string p2, "allowedSecondaryDeformation insert the card"

    .line 125
    .line 126
    invoke-static {v3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    sget-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p2}, Lx1/O;->j1(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    if-eqz p2, :cond_2

    .line 136
    .line 137
    const/4 p2, 0x1

    .line 138
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->l(Landroid/content/Context;Z)V

    .line 139
    .line 140
    .line 141
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string p1, "allowedSecondaryDeformation mSimCardName ="

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    sget-object p1, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    const-string p0, "allowedSecondaryDeformation simStatus is null return"

    .line 165
    .line 166
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    :cond_4
    return-void
.end method

.method private e(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroidx/core/app/l;->d(Landroid/content/Context;)Landroidx/core/app/l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 p1, 0x2ee2

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/core/app/l;->b(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private f(Landroid/content/Context;)V
    .locals 5

    .line 1
    const-string v0, "SimCardLoadReceiver"

    .line 2
    .line 3
    :try_start_0
    sget-object v1, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/android/launcher3/util/p2;

    .line 10
    .line 11
    const-string v2, "user_setup_complete"

    .line 12
    .line 13
    invoke-static {v2}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    sput-boolean v3, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v4, "mIsUserSetupComplete: "

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    sget-boolean v4, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    sget-boolean v3, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 47
    .line 48
    if-nez v3, :cond_0

    .line 49
    .line 50
    new-instance v3, LR1/k;

    .line 51
    .line 52
    invoke-direct {v3, p0, v1, v2, p1}, LR1/k;-><init>(Lcom/android/launcher3/stk/SimCardLoadReceiver;Lcom/android/launcher3/util/p2;Landroid/net/Uri;Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    sput-object v3, Lcom/android/launcher3/stk/SimCardLoadReceiver;->d:Lcom/android/launcher3/util/p2$a;

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception p0

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    sget-boolean v1, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f:Z

    .line 64
    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->m(Landroid/content/Context;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :goto_0
    const-string p1, "checkUserSetupComplete error"

    .line 73
    .line 74
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method private g(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "org_appcenter_system_agreement_notification_action_app_user_cancel"

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private h(Landroid/content/Context;)V
    .locals 1

    .line 1
    :try_start_0
    sget-object p0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->l0()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sput-object p1, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->S0()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    const-string p1, "SimCardLoadReceiver"

    .line 35
    .line 36
    const-string v0, "load mIcons error"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method private i(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "org_appcenter_system_agreement_notification_action_app_user_agree"

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private synthetic j(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Landroid/content/Context;Z)V
    .locals 1

    .line 1
    const-string v0, "SimCardLoadReceiver"

    .line 2
    .line 3
    :try_start_0
    sput-boolean p4, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 4
    .line 5
    if-eqz p4, :cond_1

    .line 6
    .line 7
    sget-object p4, Lcom/android/launcher3/stk/SimCardLoadReceiver;->d:Lcom/android/launcher3/util/p2$a;

    .line 8
    .line 9
    if-eqz p4, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, p2, p4}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    sput-object p1, Lcom/android/launcher3/stk/SimCardLoadReceiver;->d:Lcom/android/launcher3/util/p2$a;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string p2, "mIsUserSetupComplete: "

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    sget-boolean p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x1

    .line 43
    invoke-direct {p0, p3, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->m(Landroid/content/Context;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :goto_1
    const-string p1, "userSetupChangeListener error"

    .line 48
    .line 49
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method private synthetic k(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->n(Landroid/content/Context;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l(Landroid/content/Context;Z)V
    .locals 6

    .line 1
    sget-object p0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p0, :cond_7

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    const-string p0, "ril.radio.sim.operator"

    .line 14
    .line 15
    invoke-static {p0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sput-object p0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Landroid/telephony/TelephonyManager;->getSimOperatorNumericForPhone(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v1, v2}, Landroid/telephony/TelephonyManager;->getSimOperatorNumericForPhone(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget-object v3, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    sget-object v3, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 48
    .line 49
    const-string v4, ","

    .line 50
    .line 51
    const-string v5, ""

    .line 52
    .line 53
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_3

    .line 66
    .line 67
    :cond_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-nez v3, :cond_2

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    move v2, v0

    .line 81
    :cond_3
    :goto_0
    const-string v3, "SimCardLoadReceiver"

    .line 82
    .line 83
    if-nez p2, :cond_4

    .line 84
    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    const-string p0, "onInsertSimCardStatues SimCard ABSENT but has SimCard info is abnormal status"

    .line 88
    .line 89
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    :try_start_0
    sget-boolean p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 94
    .line 95
    if-nez p2, :cond_5

    .line 96
    .line 97
    sget-object p2, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 98
    .line 99
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    check-cast p2, Lcom/android/launcher3/util/p2;

    .line 104
    .line 105
    const-string v4, "user_setup_complete"

    .line 106
    .line 107
    invoke-static {v4}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {p2, v4, v0}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    sput-boolean p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 116
    .line 117
    if-nez p2, :cond_5

    .line 118
    .line 119
    sput-boolean v2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .line 121
    return-void

    .line 122
    :catch_0
    move-exception p2

    .line 123
    const-string v4, "onInsertSimCardStatues update user setup complete error"

    .line 124
    .line 125
    invoke-static {v3, v4, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 126
    .line 127
    .line 128
    :cond_5
    sput-boolean v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f:Z

    .line 129
    .line 130
    new-instance p2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v0, "onInsertSimCardStatues isSimCardOn="

    .line 136
    .line 137
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v0, " mSimCardName:"

    .line 144
    .line 145
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    sget-object v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v0, " operatorNum1:"

    .line 154
    .line 155
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string p0, " operatorNum2:"

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string p0, " mIcons:"

    .line 170
    .line 171
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    sget-object p0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    :try_start_1
    sget-object p0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->g:Ljava/util/List;

    .line 191
    .line 192
    sget-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 193
    .line 194
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    :cond_6
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_7

    .line 203
    .line 204
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    check-cast v0, LR1/i;

    .line 209
    .line 210
    iget-object v1, v0, LR1/i;->a:Ljava/lang/String;

    .line 211
    .line 212
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-nez v1, :cond_6

    .line 217
    .line 218
    if-eqz v2, :cond_6

    .line 219
    .line 220
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    if-eqz v1, :cond_6

    .line 233
    .line 234
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    iget-object v0, v0, LR1/i;->a:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    invoke-virtual {v1, v0, v4}, Lz1/Q2;->onPackageChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 257
    .line 258
    .line 259
    goto :goto_1

    .line 260
    :catch_1
    move-exception p0

    .line 261
    const-string p1, "onInsertSimCardStatues Handle simCard enable error"

    .line 262
    .line 263
    invoke-static {v3, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 264
    .line 265
    .line 266
    :cond_7
    :goto_2
    return-void
.end method

.method private m(Landroid/content/Context;Z)V
    .locals 11

    .line 1
    invoke-static {}, Lx1/O;->x2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    sget-object v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    if-eqz v0, :cond_a

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto/16 :goto_4

    .line 20
    .line 21
    :cond_1
    const-string v0, "ril.radio.sim.operator"

    .line 22
    .line 23
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Landroid/telephony/TelephonyManager;->getSimOperatorNumericForPhone(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const/4 v3, 0x1

    .line 43
    invoke-virtual {v2, v3}, Landroid/telephony/TelephonyManager;->getSimOperatorNumericForPhone(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget-object v4, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-nez v4, :cond_2

    .line 54
    .line 55
    sget-object v4, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 56
    .line 57
    const-string v5, ","

    .line 58
    .line 59
    const-string v6, ""

    .line 60
    .line 61
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_4

    .line 74
    .line 75
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_4

    .line 80
    .line 81
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-nez v4, :cond_3

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    move v4, v1

    .line 89
    goto :goto_1

    .line 90
    :cond_4
    :goto_0
    move v4, v3

    .line 91
    :goto_1
    const-string v5, "SimCardLoadReceiver"

    .line 92
    .line 93
    if-nez p2, :cond_5

    .line 94
    .line 95
    if-eqz v4, :cond_5

    .line 96
    .line 97
    const-string p0, "SimCard ABSENT but has SimCard info is abnormal status"

    .line 98
    .line 99
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    :try_start_0
    sget-boolean p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 104
    .line 105
    if-nez p2, :cond_6

    .line 106
    .line 107
    sget-object p2, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 108
    .line 109
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    check-cast p2, Lcom/android/launcher3/util/p2;

    .line 114
    .line 115
    const-string v6, "user_setup_complete"

    .line 116
    .line 117
    invoke-static {v6}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-virtual {p2, v6, v1}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    sput-boolean p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e:Z

    .line 126
    .line 127
    if-nez p2, :cond_6

    .line 128
    .line 129
    sput-boolean v4, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    return-void

    .line 132
    :catch_0
    move-exception p2

    .line 133
    const-string v6, "update user setup complete error"

    .line 134
    .line 135
    invoke-static {v5, v6, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    .line 137
    .line 138
    :cond_6
    sput-boolean v1, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f:Z

    .line 139
    .line 140
    new-instance p2, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v6, "isSimCardOn="

    .line 146
    .line 147
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v6, " mSimCardName:"

    .line 154
    .line 155
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    sget-object v6, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v6, " operatorNum1:"

    .line 164
    .line 165
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v6, " operatorNum2:"

    .line 172
    .line 173
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v6, " mIcons:"

    .line 180
    .line 181
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    sget-object v6, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 185
    .line 186
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 187
    .line 188
    .line 189
    move-result v6

    .line 190
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-static {v5, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    :try_start_1
    sget-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->g:Ljava/util/List;

    .line 201
    .line 202
    sget-object v6, Lcom/android/launcher3/stk/SimCardLoadReceiver;->b:Ljava/util/ArrayList;

    .line 203
    .line 204
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    :cond_7
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 209
    .line 210
    .line 211
    move-result v7

    .line 212
    if-eqz v7, :cond_a

    .line 213
    .line 214
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v7

    .line 218
    check-cast v7, LR1/i;

    .line 219
    .line 220
    iget-object v8, v7, LR1/i;->a:Ljava/lang/String;

    .line 221
    .line 222
    invoke-interface {p2, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    if-nez v8, :cond_7

    .line 227
    .line 228
    const-string v8, "com.orange.update"

    .line 229
    .line 230
    iget-object v9, v7, LR1/i;->a:Ljava/lang/String;

    .line 231
    .line 232
    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 233
    .line 234
    .line 235
    move-result v8

    .line 236
    if-eqz v4, :cond_9

    .line 237
    .line 238
    iget-object v9, v7, LR1/i;->h:[Ljava/lang/String;

    .line 239
    .line 240
    if-eqz v9, :cond_7

    .line 241
    .line 242
    invoke-static {v9}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 243
    .line 244
    .line 245
    move-result-object v9

    .line 246
    new-instance v10, LR1/l;

    .line 247
    .line 248
    invoke-direct {v10}, LR1/l;-><init>()V

    .line 249
    .line 250
    .line 251
    invoke-interface {v9, v10}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 252
    .line 253
    .line 254
    move-result-object v9

    .line 255
    new-instance v10, LR1/m;

    .line 256
    .line 257
    invoke-direct {v10, v0, v2}, LR1/m;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-interface {v9, v10}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 261
    .line 262
    .line 263
    move-result v9

    .line 264
    if-eqz v9, :cond_7

    .line 265
    .line 266
    new-instance v9, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 269
    .line 270
    .line 271
    const-string v10, "isSimCardOn = "

    .line 272
    .line 273
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    iget-object v10, v7, LR1/i;->a:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v9

    .line 285
    invoke-static {v5, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    if-eqz v8, :cond_7

    .line 289
    .line 290
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->i(Landroid/content/Context;)Z

    .line 291
    .line 292
    .line 293
    move-result v8

    .line 294
    if-eqz v8, :cond_8

    .line 295
    .line 296
    new-instance v8, Ljava/lang/StringBuilder;

    .line 297
    .line 298
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 299
    .line 300
    .line 301
    const-string v9, "user agree show ORG AppCenter = "

    .line 302
    .line 303
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v9, v7, LR1/i;->a:Ljava/lang/String;

    .line 307
    .line 308
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v8

    .line 315
    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    sget-object v8, Lcom/android/launcher3/stk/SimCardLoadReceiver;->c:Landroid/app/IZswGeneralManager;

    .line 319
    .line 320
    iget-object v7, v7, LR1/i;->a:Ljava/lang/String;

    .line 321
    .line 322
    invoke-interface {v8, v7, v3}, Landroid/app/IZswGeneralManager;->setAppEnableSetting(Ljava/lang/String;Z)Z

    .line 323
    .line 324
    .line 325
    goto :goto_2

    .line 326
    :catch_1
    move-exception p0

    .line 327
    goto :goto_3

    .line 328
    :cond_8
    const-string v7, "user not agree, show notification"

    .line 329
    .line 330
    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    .line 332
    .line 333
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->q(Landroid/content/Context;)V

    .line 334
    .line 335
    .line 336
    goto/16 :goto_2

    .line 337
    .line 338
    :cond_9
    sget-object v9, Lcom/android/launcher3/stk/SimCardLoadReceiver;->c:Landroid/app/IZswGeneralManager;

    .line 339
    .line 340
    iget-object v7, v7, LR1/i;->a:Ljava/lang/String;

    .line 341
    .line 342
    invoke-interface {v9, v7, v1}, Landroid/app/IZswGeneralManager;->setAppEnableSetting(Ljava/lang/String;Z)Z

    .line 343
    .line 344
    .line 345
    if-eqz v8, :cond_7

    .line 346
    .line 347
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 348
    .line 349
    .line 350
    goto/16 :goto_2

    .line 351
    .line 352
    :goto_3
    const-string p1, "Handle simCard enable error"

    .line 353
    .line 354
    invoke-static {v5, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 355
    .line 356
    .line 357
    :cond_a
    :goto_4
    return-void
.end method

.method private n(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    .line 1
    const-string v0, "system_agreement_notification_action"

    .line 2
    .line 3
    const-string v1, "SimCardLoadReceiver"

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Lx1/O;->s3()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->d(Landroid/content/Context;Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception p0

    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    :goto_0
    invoke-static {}, Lx1/O;->x2()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_1
    invoke-static {}, Lx1/O;->s3()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->h(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :cond_2
    :try_start_1
    const-string v2, "ZswGeneralService"

    .line 36
    .line 37
    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Landroid/app/IZswGeneralManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/IZswGeneralManager;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    sput-object v2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->c:Landroid/app/IZswGeneralManager;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catch_1
    move-exception v2

    .line 49
    :try_start_2
    const-string v3, "onReceive Exception e="

    .line 50
    .line 51
    invoke-static {v1, v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    .line 53
    .line 54
    :goto_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    const/4 v4, 0x0

    .line 63
    const/4 v5, 0x1

    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v2, "userAction: "

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    if-eqz p2, :cond_3

    .line 91
    .line 92
    sget-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->c:Landroid/app/IZswGeneralManager;

    .line 93
    .line 94
    const-string v0, "com.orange.update"

    .line 95
    .line 96
    invoke-interface {p2, v0, v5}, Landroid/app/IZswGeneralManager;->setAppEnableSetting(Ljava/lang/String;Z)Z

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->o(Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->g(Landroid/content/Context;)I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    add-int/2addr p2, v5

    .line 108
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->p(Landroid/content/Context;I)V

    .line 109
    .line 110
    .line 111
    :goto_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->e(Landroid/content/Context;)V

    .line 112
    .line 113
    .line 114
    goto/16 :goto_4

    .line 115
    .line 116
    :cond_4
    const-string v0, "android.intent.action.BOOT_COMPLETED"

    .line 117
    .line 118
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 122
    const-string v3, "ril.radio.sim.operator"

    .line 123
    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    :try_start_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v0, "onReceive boot complete: "

    .line 132
    .line 133
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    sput-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 151
    .line 152
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->f(Landroid/content/Context;)V

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_5
    const-string v0, "android.intent.action.SIM_STATE_CHANGED"

    .line 157
    .line 158
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_9

    .line 163
    .line 164
    const-string v0, "received simCard changed broadcast"

    .line 165
    .line 166
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    const-string v0, "ss"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    if-eqz p2, :cond_8

    .line 176
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    const-string v2, "simStatus = "

    .line 183
    .line 184
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    const-string v0, "ABSENT"

    .line 198
    .line 199
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_6

    .line 204
    .line 205
    invoke-direct {p0, p1, v4}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->m(Landroid/content/Context;Z)V

    .line 206
    .line 207
    .line 208
    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    sput-object v0, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 213
    .line 214
    :cond_6
    const-string v0, "LOADED"

    .line 215
    .line 216
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-eqz p2, :cond_7

    .line 221
    .line 222
    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    sput-object p2, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 227
    .line 228
    invoke-direct {p0, p1, v5}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->m(Landroid/content/Context;Z)V

    .line 229
    .line 230
    .line 231
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .line 235
    .line 236
    const-string p1, "mSimCardName ="

    .line 237
    .line 238
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    sget-object p1, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_8
    const-string p0, "simStatus is null return"

    .line 255
    .line 256
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 257
    .line 258
    .line 259
    goto :goto_4

    .line 260
    :goto_3
    const-string p1, "onReceive error"

    .line 261
    .line 262
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 263
    .line 264
    .line 265
    :cond_9
    :goto_4
    return-void
.end method

.method private o(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "org_appcenter_system_agreement_notification_action_app_user_agree"

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private p(Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "org_appcenter_system_agreement_notification_action_app_user_cancel"

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private q(Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "SimCardLoadReceiver"

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->g(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x3

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v3, "orgAppCenterUserCancelTimes="

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->r(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    const-string p1, "show org app center notification error"

    .line 36
    .line 37
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method private r(Landroid/content/Context;)V
    .locals 9

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "https://apps.orange.com"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "android.intent.action.VIEW"

    .line 10
    .line 11
    invoke-direct {p0, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const/high16 v1, 0xc000000

    .line 16
    .line 17
    invoke-static {p1, v0, p0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v2, Landroid/content/Intent;

    .line 22
    .line 23
    const-class v3, Lcom/android/launcher3/stk/SimCardLoadReceiver;

    .line 24
    .line 25
    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 26
    .line 27
    .line 28
    const-string v4, "system_agreement_notification_action"

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v5, v2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    new-instance v6, Landroid/content/Intent;

    .line 39
    .line 40
    invoke-direct {v6, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v6, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x2

    .line 47
    invoke-static {p1, v3, v6, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v4, Landroid/app/NotificationChannel;

    .line 52
    .line 53
    const-string v6, "Notification For AppCenter Agreement"

    .line 54
    .line 55
    const/4 v7, 0x4

    .line 56
    const-string v8, "system_agreement_channel"

    .line 57
    .line 58
    invoke-direct {v4, v8, v6, v7}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4, v5}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    .line 65
    .line 66
    .line 67
    const-class v6, Landroid/app/NotificationManager;

    .line 68
    .line 69
    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    check-cast v6, Landroid/app/NotificationManager;

    .line 74
    .line 75
    if-eqz v6, :cond_0

    .line 76
    .line 77
    invoke-virtual {v6, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    const v4, 0x7f1402d9

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    const v6, 0x7f1402d8

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    new-instance v7, Landroidx/core/app/i$d;

    .line 95
    .line 96
    invoke-direct {v7, p1, v8}, Landroidx/core/app/i$d;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const v8, 0x7f080e28

    .line 100
    .line 101
    .line 102
    invoke-virtual {v7, v8}, Landroidx/core/app/i$d;->n(I)Landroidx/core/app/i$d;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    invoke-virtual {v7, v4}, Landroidx/core/app/i$d;->h(Ljava/lang/CharSequence;)Landroidx/core/app/i$d;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v4, v6}, Landroidx/core/app/i$d;->g(Ljava/lang/CharSequence;)Landroidx/core/app/i$d;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    new-instance v7, Landroidx/core/app/i$b;

    .line 115
    .line 116
    invoke-direct {v7}, Landroidx/core/app/i$b;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v7, v6}, Landroidx/core/app/i$b;->h(Ljava/lang/CharSequence;)Landroidx/core/app/i$b;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    invoke-virtual {v4, v6}, Landroidx/core/app/i$d;->o(Landroidx/core/app/i$f;)Landroidx/core/app/i$d;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {v4, p0, v5}, Landroidx/core/app/i$d;->k(Landroid/app/PendingIntent;Z)Landroidx/core/app/i$d;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    const v4, 0x7f1402d7

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {p0, v0, v4, v1}, Landroidx/core/app/i$d;->a(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/i$d;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const v4, 0x7f1402d6

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {p0, v0, v4, v2}, Landroidx/core/app/i$d;->a(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/i$d;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, v3}, Landroidx/core/app/i$d;->m(I)Landroidx/core/app/i$d;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string v2, "recommendation"

    .line 158
    .line 159
    invoke-virtual {p0, v2}, Landroidx/core/app/i$d;->f(Ljava/lang/String;)Landroidx/core/app/i$d;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0, v5}, Landroidx/core/app/i$d;->p(I)Landroidx/core/app/i$d;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p0, v1}, Landroidx/core/app/i$d;->i(Landroid/app/PendingIntent;)Landroidx/core/app/i$d;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p0, v5}, Landroidx/core/app/i$d;->l(Z)Landroidx/core/app/i$d;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0, v0}, Landroidx/core/app/i$d;->e(Z)Landroidx/core/app/i$d;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0}, Landroidx/core/app/i$d;->b()Landroid/app/Notification;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-static {p1}, Landroidx/core/app/l;->d(Landroid/content/Context;)Landroidx/core/app/l;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    const/16 v0, 0x2ee2

    .line 188
    .line 189
    invoke-virtual {p1, v0, p0}, Landroidx/core/app/l;->f(ILandroid/app/Notification;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LR1/j;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, LR1/j;-><init>(Lcom/android/launcher3/stk/SimCardLoadReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
