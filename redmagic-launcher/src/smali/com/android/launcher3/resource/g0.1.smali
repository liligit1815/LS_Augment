.class public Lcom/android/launcher3/resource/g0;
.super Lcom/android/launcher3/H5;
.source "ResourceManagerProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/resource/g0$i;,
        Lcom/android/launcher3/resource/g0$g;,
        Lcom/android/launcher3/resource/g0$f;,
        Lcom/android/launcher3/resource/g0$h;
    }
.end annotation


# static fields
.field public static O:[Ljava/lang/String;


# instance fields
.field private A:Landroid/os/Messenger;

.field private B:Landroid/os/Handler;

.field private C:Landroid/os/Messenger;

.field private D:Lcom/android/launcher3/resource/g0$g;

.field private E:Lcom/android/launcher3/H5$e;

.field private F:Ljava/lang/String;

.field private G:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/H5$b;",
            ">;"
        }
    .end annotation
.end field

.field private H:Z

.field private I:Z

.field private J:Z

.field private K:Lcom/android/launcher3/resource/h1;

.field private L:Landroid/os/IBinder$DeathRecipient;

.field private final M:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private final N:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field d:Lcom/android/launcher3/resource/r0;

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:Ljava/lang/Runnable;

.field private k:[Ljava/lang/String;

.field private l:[Ljava/lang/String;

.field private m:Ljava/lang/Boolean;

.field private n:Lcom/android/launcher3/resource/G1;

.field private o:Z

.field private p:Lr1/l;

.field private q:Lcom/android/launcher3/b0;

.field private r:Ljava/lang/Boolean;

.field private s:Ljava/lang/Boolean;

.field private t:Z

.field private u:Landroid/content/Intent;

.field private final v:Landroid/content/BroadcastReceiver;

.field private final w:Landroid/content/BroadcastReceiver;

.field private x:Lcom/android/launcher3/resource/g0$i;

.field private y:I

.field private z:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "com.android.providers.downloads.ui"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/resource/g0;->O:[Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/H5;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->g:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->h:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->i:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->j:Ljava/lang/Runnable;

    .line 17
    .line 18
    const-string v2, "ZT5c1785b6e4b00299e8b27bba"

    .line 19
    .line 20
    const-string v3, "ZT5c1848bce4b00299e8b27c38"

    .line 21
    .line 22
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iput-object v2, p0, Lcom/android/launcher3/resource/g0;->k:[Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "cn.nubia.redmagickyi"

    .line 29
    .line 30
    const-string v3, "cn.nubia.inspiredwallpaper"

    .line 31
    .line 32
    const-string v4, "com.zte.heartyservice"

    .line 33
    .line 34
    const-string v5, "com.android.contacts"

    .line 35
    .line 36
    const-string v6, "cn.nubia.gamelauncher"

    .line 37
    .line 38
    filled-new-array {v4, v5, v6, v2, v3}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iput-object v2, p0, Lcom/android/launcher3/resource/g0;->l:[Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->m:Ljava/lang/Boolean;

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    iput-boolean v2, p0, Lcom/android/launcher3/resource/g0;->o:Z

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->r:Ljava/lang/Boolean;

    .line 50
    .line 51
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->s:Ljava/lang/Boolean;

    .line 52
    .line 53
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->t:Z

    .line 54
    .line 55
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->u:Landroid/content/Intent;

    .line 56
    .line 57
    new-instance v3, Lcom/android/launcher3/resource/g0$a;

    .line 58
    .line 59
    invoke-direct {v3, p0}, Lcom/android/launcher3/resource/g0$a;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 60
    .line 61
    .line 62
    iput-object v3, p0, Lcom/android/launcher3/resource/g0;->v:Landroid/content/BroadcastReceiver;

    .line 63
    .line 64
    new-instance v3, Lcom/android/launcher3/resource/g0$b;

    .line 65
    .line 66
    invoke-direct {v3, p0}, Lcom/android/launcher3/resource/g0$b;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 67
    .line 68
    .line 69
    iput-object v3, p0, Lcom/android/launcher3/resource/g0;->w:Landroid/content/BroadcastReceiver;

    .line 70
    .line 71
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->x:Lcom/android/launcher3/resource/g0$i;

    .line 72
    .line 73
    const/4 v3, -0x1

    .line 74
    iput v3, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 75
    .line 76
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->z:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->B:Landroid/os/Handler;

    .line 79
    .line 80
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->C:Landroid/os/Messenger;

    .line 81
    .line 82
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->F:Ljava/lang/String;

    .line 83
    .line 84
    new-instance v1, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->G:Ljava/util/ArrayList;

    .line 90
    .line 91
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->H:Z

    .line 92
    .line 93
    iput-boolean v2, p0, Lcom/android/launcher3/resource/g0;->I:Z

    .line 94
    .line 95
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->J:Z

    .line 96
    .line 97
    new-instance v0, Lcom/android/launcher3/resource/V;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/V;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->L:Landroid/os/IBinder$DeathRecipient;

    .line 103
    .line 104
    new-instance v0, Ljava/util/HashMap;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->M:Ljava/util/HashMap;

    .line 110
    .line 111
    new-instance v0, Ljava/util/HashMap;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->N:Ljava/util/HashMap;

    .line 117
    .line 118
    new-instance v0, Lcom/android/launcher3/resource/G1;

    .line 119
    .line 120
    invoke-direct {v0, p1}, Lcom/android/launcher3/resource/G1;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 124
    .line 125
    new-instance v0, Lr1/l;

    .line 126
    .line 127
    invoke-direct {v0, p1}, Lr1/l;-><init>(Landroid/content/Context;)V

    .line 128
    .line 129
    .line 130
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->p:Lr1/l;

    .line 131
    .line 132
    new-instance v0, Lcom/android/launcher3/resource/h1;

    .line 133
    .line 134
    invoke-direct {v0, p1}, Lcom/android/launcher3/resource/h1;-><init>(Landroid/content/Context;)V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->K:Lcom/android/launcher3/resource/h1;

    .line 138
    .line 139
    new-instance v0, Lcom/android/launcher3/b0;

    .line 140
    .line 141
    invoke-direct {v0}, Lcom/android/launcher3/b0;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->q:Lcom/android/launcher3/b0;

    .line 145
    .line 146
    new-instance v0, Lcom/android/launcher3/resource/r0;

    .line 147
    .line 148
    invoke-direct {v0, p1}, Lcom/android/launcher3/resource/r0;-><init>(Landroid/content/Context;)V

    .line 149
    .line 150
    .line 151
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 152
    .line 153
    new-instance p1, Lcom/android/launcher3/resource/g0$g;

    .line 154
    .line 155
    invoke-direct {p1}, Lcom/android/launcher3/resource/g0$g;-><init>()V

    .line 156
    .line 157
    .line 158
    iput-object p1, p0, Lcom/android/launcher3/resource/g0;->D:Lcom/android/launcher3/resource/g0$g;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/r0;->x(Lcom/android/launcher3/resource/r0$c;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method private synthetic A2(Lcom/android/launcher3/H5$c;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeCornerMode: new corner mode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "R-Loader"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "MiFavor_unread_corner_mode"

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/resource/o0;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/o0;->f0(Lcom/android/launcher3/H5$c;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/u1;->v(Lcom/android/launcher3/H5$c;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->E:Lcom/android/launcher3/H5$e;

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    invoke-interface {p0, p1}, Lcom/android/launcher3/H5$e;->a(Lcom/android/launcher3/H5$c;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method private synthetic B2()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->p2()Lcom/android/launcher3/resource/G1;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/G1;->s(Z)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "doWhenServiceConnected: delayedFlag = "

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean v2, p0, Lcom/android/launcher3/resource/g0;->H:Z

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v2, "R-Loader"

    .line 39
    .line 40
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->H:Z

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->C1()V

    .line 48
    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/android/launcher3/resource/g0;->H:Z

    .line 51
    .line 52
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3}, Lcom/android/launcher3/resource/g0;->B()Lcom/android/launcher3/H5$c;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    sget-object v4, Lcom/android/launcher3/H5$c;->h:Lcom/android/launcher3/H5$c;

    .line 65
    .line 66
    if-ne v3, v4, :cond_1

    .line 67
    .line 68
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const-string v4, "launcher_load_first_time"

    .line 73
    .line 74
    const/4 v5, -0x1

    .line 75
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-ne v3, v5, :cond_1

    .line 80
    .line 81
    const/4 v3, 0x1

    .line 82
    invoke-virtual {p0, v3}, Lcom/android/launcher3/resource/g0;->i(Z)Z

    .line 83
    .line 84
    .line 85
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v5, v4, v3}, Lcom/android/launcher3/resource/o0;->U(Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/g0;->r2(Landroid/content/Context;)V

    .line 93
    .line 94
    .line 95
    iget-boolean v3, p0, Lcom/android/launcher3/resource/g0;->t:Z

    .line 96
    .line 97
    if-eqz v3, :cond_3

    .line 98
    .line 99
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v3, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->g(Landroid/content/Context;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    new-instance v4, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    const-string v5, "onServiceConnected: isKeyguardLocked"

    .line 113
    .line 114
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    if-nez v3, :cond_2

    .line 128
    .line 129
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->a2()V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/resource/g0;->v:Landroid/content/BroadcastReceiver;

    .line 134
    .line 135
    new-instance v3, Landroid/content/IntentFilter;

    .line 136
    .line 137
    const-string v4, "android.intent.action.USER_PRESENT"

    .line 138
    .line 139
    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    const/4 v4, 0x2

    .line 143
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->g:Z

    .line 147
    .line 148
    if-eqz v0, :cond_4

    .line 149
    .line 150
    iput-boolean v1, p0, Lcom/android/launcher3/resource/g0;->g:Z

    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->Q2()V

    .line 153
    .line 154
    .line 155
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->h:Z

    .line 156
    .line 157
    if-eqz v0, :cond_5

    .line 158
    .line 159
    iput-boolean v1, p0, Lcom/android/launcher3/resource/g0;->h:Z

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->h1()V

    .line 162
    .line 163
    .line 164
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->j:Ljava/lang/Runnable;

    .line 165
    .line 166
    if-eqz p0, :cond_6

    .line 167
    .line 168
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 169
    .line 170
    .line 171
    :cond_6
    return-void
.end method

.method private synthetic C2()V
    .locals 4

    .line 1
    const-string v0, "Uninstall Binder died !!! "

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->A:Landroid/os/Messenger;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/resource/g0;->L:Landroid/os/IBinder$DeathRecipient;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-interface {v0, v2, v3}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v3, "unlinkToDeath error , e = "

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    :cond_0
    :goto_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 49
    .line 50
    new-instance v1, Lcom/android/launcher3/resource/b0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/android/launcher3/resource/b0;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private synthetic D2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->A:Landroid/os/Messenger;

    .line 3
    .line 4
    return-void
.end method

.method private E2()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "enabled_notification_listeners"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const-string v1, ""

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    const-string v1, ":"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    :goto_0
    array-length v2, v0

    .line 38
    if-ge v1, v2, :cond_1

    .line 39
    .line 40
    aget-object v2, v0, v1

    .line 41
    .line 42
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return-object p0
.end method

.method public static synthetic F1(Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher3/util/E;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic G1(Ljava/util/HashSet;Lcom/android/launcher3/resource/u1$d;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/resource/u1$d;->getPkgName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private G2()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/g0;->h2(Landroid/content/Context;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/resource/g0;->F:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->F:Ljava/lang/String;

    .line 18
    .line 19
    const/16 v0, 0x3e9

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/g0;->F2(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic H1([Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/K;->h([Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1;->w()V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/j;->i([Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->Q()V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method

.method private H2(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/util/E;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v3, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v4, Lcom/android/launcher3/resource/Y;

    .line 19
    .line 20
    invoke-direct {v4, v2, v3}, Lcom/android/launcher3/resource/Y;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 24
    .line 25
    .line 26
    const-string p1, "components"

    .line 27
    .line 28
    invoke-virtual {v1, p1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string p1, "users"

    .line 32
    .line 33
    invoke-virtual {v1, p1, v3}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    const/16 v2, 0x65

    .line 38
    .line 39
    invoke-static {p1, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->s2()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/launcher3/resource/g0;->C:Landroid/os/Messenger;

    .line 47
    .line 48
    iput-object v1, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 49
    .line 50
    :try_start_0
    const-string v1, "sendUninstallMessage"

    .line 51
    .line 52
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->A:Landroid/os/Messenger;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception p0

    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v1, "Exception : "

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public static synthetic I1(Lcom/android/launcher3/resource/u1$d;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getUnreadInfos: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "R-Loader"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic J1(Lcom/android/launcher3/resource/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->B2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K1(Lcom/android/launcher3/resource/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->D2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L1(Lcom/android/launcher3/resource/u1;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/u1;->u(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M1()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K;->A()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic N1(Lcom/android/launcher3/resource/g0;Lcom/android/launcher3/H5$c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g0;->A2(Lcom/android/launcher3/H5$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O1(Lcom/android/launcher3/resource/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->C2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic P1(Lcom/android/launcher3/resource/g0;)Lcom/android/launcher3/resource/g0$f;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method static bridge synthetic Q1(Lcom/android/launcher3/resource/g0;)Landroid/os/IBinder$DeathRecipient;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->L:Landroid/os/IBinder$DeathRecipient;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic R1(Lcom/android/launcher3/resource/g0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic S1(Lcom/android/launcher3/resource/g0;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/g0;->z:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic T1(Lcom/android/launcher3/resource/g0;Landroid/os/Messenger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/g0;->A:Landroid/os/Messenger;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic U1(Lcom/android/launcher3/resource/g0;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic V1(Lcom/android/launcher3/resource/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->a2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic W1(Lcom/android/launcher3/resource/g0;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g0;->q2(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic X1(Lcom/android/launcher3/resource/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->G2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic Y1(Lcom/android/launcher3/resource/g0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g0;->H2(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a2()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/resource/g0;->u:Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->d2()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->t:Z

    .line 15
    .line 16
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->v:Landroid/content/BroadcastReceiver;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    return-void
.end method

.method private e2(Lcom/android/launcher3/resource/K$e;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$e;->m()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$e;->l()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/resource/j;->G()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    return-object p0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v1, "getResourceItems parse id fail"

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "R-Loader"

    .line 66
    .line 67
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_2
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1, p0}, Lcom/android/launcher3/resource/p0;->e(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method private h2(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->b(Landroid/content/Context;Ljava/util/List;)Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static i2()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/resource/j;->D()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method private k2(Landroid/content/ComponentName;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1b
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "notification"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/app/NotificationManager;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->isNotificationListenerAccessGranted(Landroid/content/ComponentName;)Z

    .line 14
    .line 15
    .line 16
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "getListenerPermission ex is "

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "R-Loader"

    .line 41
    .line 42
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0
.end method

.method private o2(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8

    .line 1
    const/4 v1, 0x0

    .line 2
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->z:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    new-instance v7, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "R-Loader"

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v3, "getScreenShoot resId is "

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v3, " type "

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    new-instance v2, Lcom/android/launcher3/resource/g0$d;

    .line 48
    .line 49
    move-object v3, p0

    .line 50
    move-object v6, p1

    .line 51
    move-object v5, p2

    .line 52
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/resource/g0$d;-><init>(Lcom/android/launcher3/resource/g0;Lcom/android/launcher3/H5$i;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2}, Lcom/android/launcher3/resource/o0;->R(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :try_start_0
    monitor-enter v7
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :try_start_1
    iget-object p0, v3, Lcom/android/launcher3/resource/g0;->z:Landroid/graphics/Bitmap;

    .line 60
    .line 61
    if-nez p0, :cond_0

    .line 62
    .line 63
    const-wide/16 p0, 0xbb8

    .line 64
    .line 65
    invoke-virtual {v7, p0, p1}, Ljava/lang/Object;->wait(J)V

    .line 66
    .line 67
    .line 68
    const-string p0, "R-Loader"

    .line 69
    .line 70
    const-string p1, "getViewScreenShoot screenShootLock wait "

    .line 71
    .line 72
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    move-object p0, v0

    .line 78
    goto :goto_1

    .line 79
    :cond_0
    :goto_0
    monitor-exit v7

    .line 80
    goto :goto_2

    .line 81
    :goto_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    move-object p0, v0

    .line 85
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    :goto_2
    iget-object p0, v3, Lcom/android/launcher3/resource/g0;->z:Landroid/graphics/Bitmap;

    .line 89
    .line 90
    iput-object v1, v3, Lcom/android/launcher3/resource/g0;->z:Landroid/graphics/Bitmap;

    .line 91
    .line 92
    return-object p0
.end method

.method private q2(Ljava/lang/String;)I
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_2

    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->c()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "wallpaper"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, p1}, Lcom/android/launcher3/resource/K$d;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$e;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    instance-of v1, p1, Lcom/android/launcher3/resource/K$f;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    check-cast p1, Lcom/android/launcher3/resource/K$f;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move p1, v0

    .line 50
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v2, "getScreenShoot curForeColor is "

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v2, " targetColor is "

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const-string v2, "R-Loader"

    .line 76
    .line 77
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    if-ne p0, p1, :cond_1

    .line 81
    .line 82
    return v0

    .line 83
    :cond_1
    return p1

    .line 84
    :cond_2
    return v0
.end method

.method private r2(Landroid/content/Context;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->w:Landroid/content/BroadcastReceiver;

    .line 2
    .line 3
    new-instance v1, Landroid/content/IntentFilter;

    .line 4
    .line 5
    const-string v2, "android.intent.action.ACTION_PREFERRED_ACTIVITY_CHANGED"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g0;->h2(Landroid/content/Context;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/resource/g0;->F:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v0, "initAppChangedReceiver: "

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->F:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "R-Loader"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private s2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->C:Landroid/os/Messenger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/android/launcher3/resource/g0$e;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/g0$e;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->B:Landroid/os/Handler;

    .line 12
    .line 13
    new-instance v0, Landroid/os/Messenger;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/resource/g0;->B:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->C:Landroid/os/Messenger;

    .line 21
    .line 22
    return-void
.end method

.method private w2(Landroid/content/Context;Lcom/android/launcher3/util/E;)Z
    .locals 4

    .line 1
    const-string v0, "/"

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "com.android.systemui"

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    const-string p0, "isNotificationEnable: system ui notification."

    .line 21
    .line 22
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return v3

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 43
    .line 44
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 45
    .line 46
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-lez v2, :cond_1

    .line 57
    .line 58
    iget-object v2, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 59
    .line 60
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v2, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_1

    .line 69
    .line 70
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-object v3, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 75
    .line 76
    invoke-virtual {v2, v3, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->d(Landroid/os/UserHandle;I)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 81
    .line 82
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {p0, p1, v2}, Lcom/android/launcher3/resource/r0;->p(ILjava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    new-instance v2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v3, "isNotificationEnable pkg\'s res "

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object v3, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 103
    .line 104
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_2

    .line 135
    .line 136
    iget-object p1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 137
    .line 138
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object p2, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 143
    .line 144
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/nubia/c;->r(Ljava/lang/String;Landroid/os/UserHandle;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    :cond_2
    return p0

    .line 148
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string p2, "isNotificationEnable exception "

    .line 154
    .line 155
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    const/4 p0, 0x1

    .line 173
    return p0
.end method

.method private z2()Z
    .locals 1

    .line 1
    const-string p0, "ro.cell.name"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "work"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method


# virtual methods
.method public A()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->E()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public A0(Landroid/content/ComponentName;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->a0(Landroid/content/ComponentName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "isHiddenTask: "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/content/ComponentName;->toShortString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string p1, "null need to be hidden!"

    .line 40
    .line 41
    :goto_0
    const-string v0, "R-Loader"

    .line 42
    .line 43
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_1
    return p0
.end method

.method public A1()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "startLoader needReload is "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/resource/g0;->o:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "R-Loader"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->o:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->A()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->o:Z

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->d0()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public B()Lcom/android/launcher3/H5$c;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->j()Lcom/android/launcher3/H5$c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "MiFavor_unread_corner_mode"

    .line 26
    .line 27
    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/android/launcher3/H5$c;->valueOf(Ljava/lang/String;)Lcom/android/launcher3/H5$c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/o0;->f0(Lcom/android/launcher3/H5$c;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-object p0
.end method

.method public B0(Landroid/content/ComponentName;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->b0(Landroid/content/ComponentName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public B1()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/o0;->e0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C()Ljava/util/HashSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "LN1/e;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->w()Ljava/util/HashSet;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public C0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->F:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public C1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->I()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public D0(Lcom/android/launcher3/P2;Landroid/content/ComponentName;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->l:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->a0:Z

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const-class p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    return v0

    .line 46
    :cond_1
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->i0:Z

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    const-class p0, Lcom/android/launcher3/settings/ConcernModeActivity;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    return v0

    .line 73
    :cond_2
    if-eqz p1, :cond_3

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->j0:Z

    .line 80
    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    const-class p0, Lcom/android/launcher3/settings/StandardModeActivity;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_3

    .line 98
    .line 99
    return v0

    .line 100
    :cond_3
    if-eqz p1, :cond_4

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->k0:Z

    .line 107
    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    const-class p0, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;

    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_4

    .line 125
    .line 126
    return v0

    .line 127
    :cond_4
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-static {p0, p2}, Lx1/O;->s1(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_5

    .line 136
    .line 137
    return v0

    .line 138
    :cond_5
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p0, p2}, Lx1/O;->v(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    return p0
.end method

.method public E0()Z
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->E2()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-class v2, Lcom/android/launcher3/notification/NotificationListener;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v2, " isNotificationAccessStateOpen "

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "R-Loader"

    .line 38
    .line 39
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public E1(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/util/E;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "uninstallApps--start"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "R-Loader"

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->A:Landroid/os/Messenger;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/g0;->H2(Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 45
    .line 46
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v1, "com.zte.mifavor.launcher.adapter"

    .line 50
    .line 51
    const-string v2, "com.zte.mifavor.launcher.adapter.BatchUninstallService"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/resource/g0$c;

    .line 57
    .line 58
    invoke-direct {v1, p0, p2}, Lcom/android/launcher3/resource/g0$c;-><init>(Lcom/android/launcher3/resource/g0;Ljava/util/ArrayList;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    invoke-virtual {p1, v0, v1, p0}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    return-void
.end method

.method public F()Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Landroid/content/res/Resources;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "default_workspace"

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/v4;->f:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/android/launcher3/resource/Q;->t(Ljava/lang/String;Ljava/lang/String;)Landroid/util/Pair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public F0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/z;->n(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method F2(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->G:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, " notifyBGDataChange"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "R-Loader"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->G:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/android/launcher3/H5$b;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-interface {v0, p1}, Lcom/android/launcher3/H5$b;->a(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-void
.end method

.method public G(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 0

    .line 1
    sget-object p0, Lf1/a;->A:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/p0;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public G0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->s:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->h(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->s:Ljava/lang/Boolean;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "isPrimaryUser: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/resource/g0;->s:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "R-Loader"

    .line 48
    .line 49
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->s:Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public H()Lcom/android/launcher3/b0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->q:Lcom/android/launcher3/b0;

    .line 2
    .line 3
    return-object p0
.end method

.method public H0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->e0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public I()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->i()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    const-string p0, "R-Loader"

    .line 31
    .line 32
    const-string v0, "getDynamicShowHiddenAppsInfoList is null"

    .line 33
    .line 34
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    new-instance p0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public I0()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string v0, "isShowGalleryEntry: menu resource is null."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$a;->i()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method I2(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)V
    .locals 4

    .line 1
    const-string v0, "/"

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {p1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 21
    .line 22
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 23
    .line 24
    iget-object v2, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 25
    .line 26
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 41
    .line 42
    invoke-virtual {v2, v3, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->d(Landroid/os/UserHandle;I)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 50
    .line 51
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {p0, p1, v2, p3}, Lcom/android/launcher3/resource/r0;->j(ILjava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v2, "setCanShowBadge pkg\'s  "

    .line 66
    .line 67
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_1

    .line 103
    .line 104
    iget-object p0, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    iget-object p1, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 111
    .line 112
    invoke-static {p0, p1, p3}, Lcom/android/launcher3/nubia/c;->r(Ljava/lang/String;Landroid/os/UserHandle;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string p2, "setCanShowBadge exception "

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    :cond_1
    return-void
.end method

.method public J()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->x()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public J0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->f0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public J2(Landroid/app/WallpaperInfo;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "cn.nubia.inspiredwallpaper"

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/resource/g0;->J:Z

    .line 19
    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v0, "setIsInspiredWallpaper: mIsInspiredWallpaper "

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->J:Z

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "R-Loader"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public K(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/resource/g0;->M:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->M:Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-static {p1, p2}, Lcom/android/launcher3/resource/Q;->l(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->M:Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_2
    return-object p1

    .line 62
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public K0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->g0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public K2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/g0;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public L(Landroid/content/ComponentName;Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->N:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->N:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/String;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p2, ""

    .line 44
    .line 45
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 51
    return-object p0
.end method

.method public L0()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string v0, "isShowOnLineEntry: menu resource is null."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$a;->j()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public L2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/g0;->H:Z

    .line 2
    .line 3
    return-void
.end method

.method public M()Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    if-nez p0, :cond_2

    .line 26
    .line 27
    const-string p0, "R-Loader"

    .line 28
    .line 29
    const-string v0, "getFolderAddIcon iconResource is null"

    .line 30
    .line 31
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const v0, 0x7f080d2e

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->Z1()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const v2, 0x7f040781

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 75
    .line 76
    .line 77
    :cond_1
    invoke-static {p0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/resource/w;->j()Landroid/graphics/Bitmap;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public M0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->h0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method M2(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/G1;->g()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/G1;->C(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->D()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public N()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    :goto_0
    if-nez p0, :cond_1

    .line 32
    .line 33
    const-string p0, "R-Loader"

    .line 34
    .line 35
    const-string v0, "getFolderIcon iconResource is null"

    .line 36
    .line 37
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const v0, 0x7f0810d6

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/w;->l()Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public N0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->i0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public N2([B)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/G1;->g()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/G1;->B([B)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->D()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public O()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->z()Ljava/util/HashMap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public O0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->j0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public O2(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/G1;->g()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/G1;->A(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->D()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public P(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->B(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public P0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->k0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public P2()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->U0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public Q(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Q0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->n0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public Q2()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "trySetDefaultHome"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "R-Loader"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->Q()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->g:Z

    .line 43
    .line 44
    return-void
.end method

.method public R()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string v0, "getGalleryBackground: menu resource is null."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$a;->f()Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public R0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method R2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->m:Ljava/lang/Boolean;

    .line 3
    .line 4
    return-void
.end method

.method public S()Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string v0, "getGalleryEntrance: menu resource is null."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    new-instance p0, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$a;->g()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public S0()V
    .locals 0

    .line 1
    invoke-static {}, Lx1/O;->x2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->z0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public T0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->G()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->A0(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public V0(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string p1, "markNotificationHasMsg unReadInfoManager is null "

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Lcom/android/launcher3/resource/Z;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/resource/Z;-><init>(Lcom/android/launcher3/resource/u1;Ljava/util/HashMap;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public W0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->B0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public X()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->F()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public X0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->C0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public Y()Lcom/android/launcher3/H5$g;
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "R-Loader"

    .line 12
    .line 13
    const-string v0, "getMenuState menuState was inited failed, use default value"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/android/launcher3/H5$g;

    .line 19
    .line 20
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/high16 v7, -0x1000000

    .line 25
    .line 26
    const/4 v8, 0x1

    .line 27
    const-string v3, ""

    .line 28
    .line 29
    const-string v4, "default_effect_smooth"

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    const/4 v6, -0x1

    .line 33
    invoke-direct/range {v1 .. v8}, Lcom/android/launcher3/H5$g;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIZ)V

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_0
    new-instance v2, Lcom/android/launcher3/H5$g;

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->h()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->f()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->e()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->c()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->i()I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$c;->d()Z

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    invoke-direct/range {v2 .. v9}, Lcom/android/launcher3/H5$g;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIZ)V

    .line 68
    .line 69
    .line 70
    return-object v2
.end method

.method public Y0()V
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/resource/X;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/resource/X;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Z(Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string p1, "getOnlineEntrance: menu resource is null."

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    new-instance p0, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/K$a;->h(Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public varargs Z0(Landroid/os/UserHandle;I[Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/resource/W;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Lcom/android/launcher3/resource/W;-><init>([Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Z1()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->m:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->m()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return v2

    .line 22
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v3, 0x1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    return v3

    .line 30
    :cond_2
    invoke-virtual {v1}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v4, "R-Loader"

    .line 35
    .line 36
    if-nez v1, :cond_3

    .line 37
    .line 38
    const-string p0, "checkNeedTintAddIcon menu is null "

    .line 39
    .line 40
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return v3

    .line 44
    :cond_3
    const-string v5, "wallpaper"

    .line 45
    .line 46
    invoke-virtual {v1, v5}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-nez v1, :cond_4

    .line 51
    .line 52
    const-string p0, "checkNeedTintAddIcon menuTab is null "

    .line 53
    .line 54
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    return v3

    .line 58
    :cond_4
    iget-object v4, p0, Lcom/android/launcher3/resource/g0;->k:[Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-interface {v4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_5

    .line 69
    .line 70
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->m:Ljava/lang/Boolean;

    .line 73
    .line 74
    return v2

    .line 75
    :cond_5
    invoke-virtual {v1, v0}, Lcom/android/launcher3/resource/K$d;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$e;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-nez v0, :cond_6

    .line 80
    .line 81
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->m:Ljava/lang/Boolean;

    .line 84
    .line 85
    return v3

    .line 86
    :cond_6
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    if-nez v1, :cond_7

    .line 95
    .line 96
    return v3

    .line 97
    :cond_7
    instance-of v4, v0, Lcom/android/launcher3/resource/K$f;

    .line 98
    .line 99
    if-eqz v4, :cond_a

    .line 100
    .line 101
    check-cast v0, Lcom/android/launcher3/resource/K$f;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    const/4 v4, -0x1

    .line 108
    if-ne v0, v4, :cond_8

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/android/launcher3/resource/K$c;->c()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eq v0, v4, :cond_9

    .line 115
    .line 116
    :cond_8
    move v2, v3

    .line 117
    :cond_9
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/android/launcher3/resource/g0;->m:Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    return p0

    .line 128
    :cond_a
    return v3
.end method

.method public a(Lcom/android/launcher3/H5$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->G:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()Ljava/util/HashSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "LN1/e;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->I()Ljava/util/HashSet;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public b(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->c(Landroid/content/ComponentName;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b0(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "R-Loader"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    const-string p0, "getProcessedShortcutIcon iconResource is null"

    .line 36
    .line 37
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_1
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/resource/w;->q(Landroid/graphics/Bitmap;Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    :goto_0
    const-string p0, "getProcessedShortcutIcon: getIconStatus null"

    .line 47
    .line 48
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-object v1
.end method

.method public b1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->N:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->N:Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method b2()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "doWhenServiceConnected: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/resource/f0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/f0;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->d(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c0(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/resource/z;->m()V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/g0;->b0(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public c1()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/resource/r0;->t()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->i:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method c2()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "doWhenServiceDisconnected: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 10
    .line 11
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d0()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "R-Loader"

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    const-string p0, "getQuickCallAllAppsIcon iconResource is null"

    .line 36
    .line 37
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/w;->r()Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    :goto_0
    const-string p0, "getQuickCallAllAppsIcon iconStatus is null"

    .line 47
    .line 48
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public d1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->D0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/resource/r0;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j;->g(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public e0(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/H5$j;",
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
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string p0, "R-Loader"

    .line 13
    .line 14
    const-string p1, "getResourceItems MenuResource is null "

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    const-string p0, "R-Loader"

    .line 31
    .line 32
    const-string p1, "getResourceItems menu is null "

    .line 33
    .line 34
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    invoke-virtual {v1, p1}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    const-string p0, "R-Loader"

    .line 45
    .line 46
    const-string p1, "getResourceItems error srcType passed in "

    .line 47
    .line 48
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    monitor-enter v1

    .line 58
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$d;->f()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$c;->g()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_4

    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    check-cast v3, Lcom/android/launcher3/resource/K$e;

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_3

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    const/4 v3, 0x0

    .line 106
    :goto_0
    const/4 p1, -0x1

    .line 107
    if-eqz v3, :cond_5

    .line 108
    .line 109
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-ne p1, v1, :cond_5

    .line 114
    .line 115
    new-instance v1, Lcom/android/launcher3/H5$j;

    .line 116
    .line 117
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$e;->q()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$e;->u()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$e;->m()Landroid/graphics/drawable/Drawable;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-direct {v1, v4, v5, v6, v3}, Lcom/android/launcher3/H5$j;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    :cond_5
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    :cond_6
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-eqz v2, :cond_8

    .line 148
    .line 149
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Lcom/android/launcher3/resource/K$e;

    .line 154
    .line 155
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    if-eq p1, v3, :cond_6

    .line 160
    .line 161
    invoke-direct {p0, v2}, Lcom/android/launcher3/resource/g0;->e2(Lcom/android/launcher3/resource/K$e;)Landroid/graphics/drawable/Drawable;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    if-nez v3, :cond_7

    .line 166
    .line 167
    const-string v2, "R-Loader"

    .line 168
    .line 169
    const-string v3, "getResourceItems can not load wallpaperThumb"

    .line 170
    .line 171
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_7
    new-instance v4, Lcom/android/launcher3/H5$j;

    .line 176
    .line 177
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->q()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v6

    .line 185
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->u()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-direct {v4, v5, v6, v2, v3}, Lcom/android/launcher3/H5$j;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_8
    return-object v0

    .line 197
    :catchall_0
    move-exception p0

    .line 198
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 199
    throw p0
.end method

.method public e1()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->s()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public f(Lcom/android/launcher3/H5$c;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/a0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/resource/a0;-><init>(Lcom/android/launcher3/resource/g0;Lcom/android/launcher3/H5$c;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f0()Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const-string v1, "R-Loader"

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "getRestoredAppIcon iconStatus is null"

    .line 15
    .line 16
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    const-string p0, "getRestoredAppIcon iconResource is null"

    .line 35
    .line 36
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/w;->s()Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public f1(I)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "resetLoadedState flag is "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "R-Loader"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/resource/y0;->d()Lcom/android/launcher3/resource/y0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/android/launcher3/resource/y0;->d()Lcom/android/launcher3/resource/y0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/resource/y0;->g()V

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    if-ne p1, p0, :cond_1

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "folder_shortcut_title"

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/o0;->N(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p1, "app_location_info"

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/o0;->N(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public f2()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->o0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 11
    .line 12
    :cond_0
    iget p0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public g(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/r0;->i(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->J()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public g1(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->E0(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->l()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public h()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h0(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const-string v0, "screenshot"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/resource/g0;->o2(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h1()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "saveConciseMode isSysServiceValid:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "R-Loader"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 30
    .line 31
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/r0;->h(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/android/launcher3/resource/g0;->h:Z

    .line 45
    .line 46
    return-void
.end method

.method public i(Z)Z
    .locals 6

    .line 1
    const-string p1, "R-Loader"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->E2()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    new-instance v3, Landroid/content/ComponentName;

    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const-class v5, Lcom/android/launcher3/notification/NotificationListener;

    .line 23
    .line 24
    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, v3}, Lcom/android/launcher3/resource/g0;->k2(Landroid/content/ComponentName;)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-nez v4, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {p0, v4}, Lcom/android/launcher3/resource/r0;->v(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    goto :goto_4

    .line 45
    :cond_0
    :goto_0
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    const-string p0, " changeNotificationAccessState already opened!"

    .line 52
    .line 53
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return v0

    .line 57
    :cond_1
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 v2, 0x0

    .line 65
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Landroid/content/ComponentName;

    .line 76
    .line 77
    if-nez v2, :cond_2

    .line 78
    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    const/16 v4, 0x3a

    .line 86
    .line 87
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :goto_2
    invoke-virtual {v3}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    const-string p0, "enabled_notification_listeners"

    .line 99
    .line 100
    if-eqz v2, :cond_4

    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    goto :goto_3

    .line 107
    :cond_4
    const-string v2, ""

    .line 108
    .line 109
    :goto_3
    invoke-static {v1, p0, v2}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .line 111
    .line 112
    const/4 p0, 0x1

    .line 113
    return p0

    .line 114
    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    const-string v2, " changeNotificationAccessState Exception"

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    return v0
.end method

.method public i0(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const-string v0, "screenshot_no_dock"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/resource/g0;->o2(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i1(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "LN1/e;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j;->F0(Ljava/util/HashSet;Landroid/os/UserHandle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j(Lcom/android/launcher3/util/E;I)Z
    .locals 5

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "notification_badging"

    .line 16
    .line 17
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 18
    .line 19
    .line 20
    :try_start_1
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/resource/u1;->x()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 25
    .line 26
    .line 27
    return v1

    .line 28
    :catch_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catch_1
    move-exception p0

    .line 31
    move v1, v2

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v4, " changeUnreadInfoState ComponentName is :"

    .line 39
    .line 40
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/util/E;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v4, " state is "

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    if-ne p2, v1, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    move v1, v2

    .line 73
    :goto_0
    invoke-virtual {p0, v3, p1, v1}, Lcom/android/launcher3/resource/g0;->I2(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 74
    .line 75
    .line 76
    return v2

    .line 77
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string p2, " changeUnreadInfoState exception is :"

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    return v1
.end method

.method public j1(Z)V
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "saveStreamerMode streamerMode:"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "R-Loader"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v1, "streamer_mode"

    .line 32
    .line 33
    invoke-static {p0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v1, "saveStreamerMode result"

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception p0

    .line 59
    new-instance p1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v1, "saveStreamerMode exception "

    .line 65
    .line 66
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public j2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "R-Loader"

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "checkFontIfNeedChanged: ResourceState is null , do nothing!"

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "custom_font"

    .line 24
    .line 25
    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/4 v3, 0x0

    .line 38
    const-string v4, "MiFavor_current_font"

    .line 39
    .line 40
    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v5, "checkFontIfNeedChanged: curSysFont = "

    .line 50
    .line 51
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v5, ", cacheFont = "

    .line 58
    .line 59
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Lx1/O;->X1(Ljava/lang/String;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    const-string p0, "checkFontIfNeedChanged: curSysFont == cacheFont"

    .line 79
    .line 80
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    invoke-virtual {p0, v4, v1}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    if-eqz p0, :cond_2

    .line 92
    .line 93
    invoke-interface {p0}, Lcom/android/launcher3/H5$i;->f()V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method

.method public k0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->L()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public k1(Lcom/android/launcher3/H5$a;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->J0(Lcom/android/launcher3/H5$a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "R-Loader"

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "checkIconIfNeedChanged ResourceState is null , do nothing !"

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->l()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, ""

    .line 28
    .line 29
    const-string v4, "MiFavor_current_icon"

    .line 30
    .line 31
    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {}, Lcom/android/launcher3/resource/o0;->o()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-static {v5}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    const-string v6, "0"

    .line 48
    .line 49
    const-string v7, "MiFavor_current_third_icon_beautify_switch_status"

    .line 50
    .line 51
    invoke-interface {v5, v7, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-static {v1, v2}, Lx1/O;->X1(Ljava/lang/String;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-eqz v6, :cond_1

    .line 60
    .line 61
    invoke-static {v3, v5}, Lx1/O;->X1(Ljava/lang/String;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_1

    .line 66
    .line 67
    const-string p0, "checkIconIfNeedChanged: curSysIconId == cacheIconId"

    .line 68
    .line 69
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-virtual {p0, v4, v1}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v7, v3}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance v4, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v6, "checkIconIfNeedChanged curSysIconId:"

    .line 85
    .line 86
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v1, " cacheIconId:"

    .line 93
    .line 94
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v1, " curSysThirdIconBeautifySwitchStatus:"

    .line 101
    .line 102
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v1, " cacheThirdIconBeautifySwitchStatus:"

    .line 109
    .line 110
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v1, " resourceState.getIconStatus().getIconStatus():"

    .line 117
    .line 118
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1}, Lcom/android/launcher3/resource/z;->j()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Lcom/android/launcher3/resource/z;->j()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    const/4 v2, 0x2

    .line 148
    if-eq v1, v2, :cond_3

    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    if-eqz p0, :cond_2

    .line 155
    .line 156
    const/4 v0, 0x0

    .line 157
    invoke-interface {p0, v0}, Lcom/android/launcher3/H5$i;->c(Z)V

    .line 158
    .line 159
    .line 160
    :cond_2
    return-void

    .line 161
    :cond_3
    invoke-static {}, Lcom/android/launcher3/resource/y0;->d()Lcom/android/launcher3/resource/y0;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    if-nez p0, :cond_4

    .line 166
    .line 167
    const-string p0, "checkIconIfNeedChanged themeChangeManager has not init"

    .line 168
    .line 169
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_4
    const/4 v0, 0x1

    .line 174
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/y0;->e(Z)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public l0()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "LR1/i;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->M()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public l1(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->K0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()V
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "R-Loader"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "checkThemeIfNeedChanged ResourceState is null , do nothing !"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->m()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    const-string p0, "checkThemeIfNeedChanged curSysThemeId is null , do nothing !"

    .line 26
    .line 27
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v3}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const-string v4, "MiFavor_current_theme"

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-static {}, Lcom/android/launcher3/resource/o0;->n()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-static {v5}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    const-string v6, ""

    .line 59
    .line 60
    const-string v7, "MiFavor_current_theme_version"

    .line 61
    .line 62
    invoke-interface {v5, v7, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    new-instance v6, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v8, "checkThemeIfNeedChanged curSysThemeVersion:"

    .line 72
    .line 73
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v8, " cacheThemeVersion:"

    .line 80
    .line 81
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-virtual {v6}, Lcom/android/launcher3/resource/z;->j()I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    const/4 v8, 0x2

    .line 103
    const/4 v9, 0x0

    .line 104
    if-eq v6, v8, :cond_4

    .line 105
    .line 106
    const-string p0, "checkThemeIfNeedChanged getIconStatus is not ICON_STATUS_LOADED_UI , update status!"

    .line 107
    .line 108
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-nez p0, :cond_2

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-nez p0, :cond_3

    .line 123
    .line 124
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_3

    .line 129
    .line 130
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    if-eqz p0, :cond_3

    .line 135
    .line 136
    invoke-interface {p0, v9}, Lcom/android/launcher3/H5$i;->e(Z)V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0, v7, v4}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    return-void

    .line 147
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    if-nez v0, :cond_5

    .line 152
    .line 153
    const-string p0, "checkThemeIfNeedChanged menuState is null "

    .line 154
    .line 155
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$c;->g()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    const-string v6, "checkThemeIfNeedChanged curSysThemeId is "

    .line 169
    .line 170
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v6, " / "

    .line 177
    .line 178
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    if-eqz v3, :cond_6

    .line 196
    .line 197
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-nez v3, :cond_6

    .line 202
    .line 203
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    if-eqz v3, :cond_6

    .line 208
    .line 209
    const-string p0, "checkThemeIfNeedChanged curSysThemeId  == cacheThemeId "

    .line 210
    .line 211
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_6
    invoke-static {}, Lcom/android/launcher3/resource/y0;->d()Lcom/android/launcher3/resource/y0;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    if-nez v3, :cond_7

    .line 220
    .line 221
    const-string p0, "checkThemeIfNeedChanged themeChangeManager has not init"

    .line 222
    .line 223
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->R2()V

    .line 228
    .line 229
    .line 230
    const/4 v1, 0x1

    .line 231
    invoke-virtual {v3, v1}, Lcom/android/launcher3/resource/y0;->f(Z)V

    .line 232
    .line 233
    .line 234
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    invoke-virtual {v3, v7, v4}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-static {}, Lx1/S;->r()Z

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    if-eqz v3, :cond_8

    .line 246
    .line 247
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-nez v0, :cond_8

    .line 252
    .line 253
    const-string v0, "default_theme_45"

    .line 254
    .line 255
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_8

    .line 260
    .line 261
    iput-boolean v1, p0, Lcom/android/launcher3/resource/g0;->o:Z

    .line 262
    .line 263
    return-void

    .line 264
    :cond_8
    iput-boolean v9, p0, Lcom/android/launcher3/resource/g0;->o:Z

    .line 265
    .line 266
    return-void
.end method

.method public m0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->N()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public m1(Lcom/android/launcher3/H5$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/g0;->E:Lcom/android/launcher3/H5$e;

    .line 2
    .line 3
    return-void
.end method

.method public m2()Lcom/android/launcher3/resource/r0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->k()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n0()Lcom/android/launcher3/resource/h1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->K:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    return-object p0
.end method

.method public n1(ZZ)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/z;->v(ZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method n2()Lcom/android/launcher3/resource/g0$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->D:Lcom/android/launcher3/resource/g0$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(LN1/e;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->n(LN1/e;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public o0()I
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "notification_badging"

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public o1(Lcom/android/launcher3/c1$d;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/z;->q(Lcom/android/launcher3/c1$d;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p(Ljava/lang/String;LN1/e;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j;->p(Ljava/lang/String;LN1/e;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p0()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/H5$k;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader"

    .line 8
    .line 9
    const-string v0, "getUnreadInfos unReadInfoManager not init"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/u1;->p()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance v0, Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v1, Lcom/android/launcher3/resource/c0;

    .line 40
    .line 41
    invoke-direct {v1, v0}, Lcom/android/launcher3/resource/c0;-><init>(Ljava/util/HashSet;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object v0, Lcom/android/launcher3/resource/u1;->q:Ljava/util/Comparator;

    .line 49
    .line 50
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance v0, Lcom/android/launcher3/resource/d0;

    .line 55
    .line 56
    invoke-direct {v0}, Lcom/android/launcher3/resource/d0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->peek(Ljava/util/function/Consumer;)Ljava/util/stream/Stream;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v0, Lcom/android/launcher3/resource/e0;

    .line 64
    .line 65
    invoke-direct {v0}, Lcom/android/launcher3/resource/e0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Ljava/util/List;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_2
    :goto_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 84
    .line 85
    return-object p0
.end method

.method public p1(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/resource/j;->L0(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method p2()Lcom/android/launcher3/resource/G1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    return-object p0
.end method

.method public q0()Landroid/util/ArrayMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->P()Landroid/util/ArrayMap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public q1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/g0;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/r0;->l(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r0()Landroid/graphics/Rect;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/android/launcher3/H5$i;->a()Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "R-Loader"

    .line 17
    .line 18
    const-string v0, "getWorkspacePadding callback is null!"

    .line 19
    .line 20
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public r1(Lcom/android/launcher3/H5$f;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/K;->D(Lcom/android/launcher3/H5$f;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public s(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/r0;->o(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s0()Lr1/l;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->p:Lr1/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public s1()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->N0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j;->q(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t0(Lcom/android/launcher3/H5$b;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->G:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public t1(Lcom/android/launcher3/H5$h;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/o0;->a0(Lcom/android/launcher3/H5$h;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t2(Lcom/android/launcher3/util/E;)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->o0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 11
    .line 12
    :cond_0
    iget v0, p0, Lcom/android/launcher3/resource/g0;->y:I

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string p0, "R-Loader"

    .line 17
    .line 18
    const-string p1, " isIconDotShow totalUnreadState is close"

    .line 19
    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/g0;->u2(Lcom/android/launcher3/util/E;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public u()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->k()Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->F()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u1(Lcom/android/launcher3/H5$i;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/o0;->b0(Lcom/android/launcher3/H5$i;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method u2(Lcom/android/launcher3/util/E;)Z
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/resource/g0;->w2(Landroid/content/Context;Lcom/android/launcher3/util/E;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public v(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->r(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public v0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->S()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public v1(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->O0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public v2()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->d0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public w(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lf1/a;->A:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/p0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, ""

    .line 19
    .line 20
    return-object p0
.end method

.method public w0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/o0;->H(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public w1(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->P0(Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public x(Ljava/lang/String;)I
    .locals 0

    .line 1
    sget-object p0, Lf1/a;->A:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/p0;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method public x0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->W()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public x1(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/j;->Q0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public x2()Z
    .locals 2

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->J:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v1, "desktop_shielding_switch"

    .line 15
    .line 16
    invoke-static {p0, v1, v0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-ne p0, v1, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    return v0
.end method

.method public y()[I
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->s()[I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public y0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->r:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/resource/g0;->z2()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/a;->a()Lcom/zte/mifavor/launcher/adapter/compat/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/launcher/adapter/compat/a;->b(Landroid/content/Context;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    :cond_1
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-static {}, Lx1/O;->K1()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    :cond_2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, p0, Lcom/android/launcher3/resource/g0;->r:Ljava/lang/Boolean;

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v2, "isDoubleSystem res!"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "R-Loader"

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->r:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0
.end method

.method public y1(Lcom/android/launcher3/c1$e;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/z;->r(Lcom/android/launcher3/c1$e;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method y2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/g0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/resource/j;->t()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public z0(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/android/launcher3/resource/j;->Z(Landroid/content/ComponentName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "isHiddenApp: "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/content/ComponentName;->toShortString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v0, "null need to be hidden!"

    .line 40
    .line 41
    :goto_0
    const-string v1, "R-Loader"

    .line 42
    .line 43
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_1
    if-nez p0, :cond_3

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p2, p3, p0}, Lx1/O;->n2(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    const/4 p0, 0x0

    .line 60
    return p0

    .line 61
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 62
    return p0
.end method

.method public z1(Ljava/lang/String;)Z
    .locals 9

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "R-Loader"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "setWallpaper the id is null"

    .line 11
    .line 12
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/resource/G1;->g()V

    .line 19
    .line 20
    .line 21
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v3, p0, Lcom/android/launcher3/resource/g0;->x:Lcom/android/launcher3/resource/g0$i;

    .line 30
    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    new-instance v3, Lcom/android/launcher3/resource/g0$i;

    .line 34
    .line 35
    invoke-direct {v3, p0}, Lcom/android/launcher3/resource/g0$i;-><init>(Lcom/android/launcher3/resource/g0;)V

    .line 36
    .line 37
    .line 38
    iput-object v3, p0, Lcom/android/launcher3/resource/g0;->x:Lcom/android/launcher3/resource/g0$i;

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget-object v4, p0, Lcom/android/launcher3/resource/g0;->x:Lcom/android/launcher3/resource/g0$i;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Lcom/android/launcher3/resource/K$c;->a(Lcom/android/launcher3/resource/g0$h;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception p0

    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/resource/g0;->x:Lcom/android/launcher3/resource/g0$i;

    .line 58
    .line 59
    invoke-virtual {v3, p1, v0}, Lcom/android/launcher3/resource/g0$i;->c(Ljava/lang/String;Lcom/android/launcher3/resource/K$a;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_2

    .line 64
    .line 65
    const-string p0, "setWallpaper the id now is used or setting !!!"

    .line 66
    .line 67
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return v1

    .line 71
    :cond_2
    const-string v3, "wallpaper"

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v3, 0x0

    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/K$d;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$e;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move-object v4, v3

    .line 86
    :goto_1
    instance-of v5, v4, Lcom/android/launcher3/resource/K$f;

    .line 87
    .line 88
    if-eqz v5, :cond_e

    .line 89
    .line 90
    move-object v5, v4

    .line 91
    check-cast v5, Lcom/android/launcher3/resource/K$f;

    .line 92
    .line 93
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    if-nez v6, :cond_6

    .line 98
    .line 99
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->G()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/g0;->M2(I)Z

    .line 122
    .line 123
    .line 124
    goto/16 :goto_3

    .line 125
    .line 126
    :cond_4
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {v0}, Lcom/android/launcher3/resource/p0;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v3, Ljava/io/File;

    .line 135
    .line 136
    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    if-eqz v3, :cond_5

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/g0;->O2(Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    goto/16 :goto_3

    .line 149
    .line 150
    :cond_5
    const-string p0, "setWallpaper preset src not found "

    .line 151
    .line 152
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    goto/16 :goto_3

    .line 156
    .line 157
    :cond_6
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 158
    .line 159
    .line 160
    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    const-string v7, "setWallpaper src not found,need to delete the item!"

    .line 162
    .line 163
    const/4 v8, 0x1

    .line 164
    if-ne v8, v6, :cond_8

    .line 165
    .line 166
    :try_start_1
    new-instance v3, Ljava/io/File;

    .line 167
    .line 168
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-eqz v3, :cond_7

    .line 180
    .line 181
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/g0;->O2(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    goto/16 :goto_3

    .line 189
    .line 190
    :cond_7
    invoke-static {v2, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v4}, Lcom/android/launcher3/resource/K$d;->c(Lcom/android/launcher3/resource/K$e;)V

    .line 194
    .line 195
    .line 196
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 201
    .line 202
    .line 203
    goto/16 :goto_3

    .line 204
    .line 205
    :cond_8
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    const/4 v8, -0x1

    .line 210
    if-ne v8, v6, :cond_d

    .line 211
    .line 212
    new-instance v6, Ljava/io/File;

    .line 213
    .line 214
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 222
    .line 223
    .line 224
    move-result v6

    .line 225
    if-eqz v6, :cond_c

    .line 226
    .line 227
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->J()Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-nez v0, :cond_9

    .line 236
    .line 237
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    const-string v3, "wallpaper/wallpaper169.jpg"

    .line 242
    .line 243
    invoke-static {v0, v3}, Lcom/android/launcher3/resource/K;->k(Ljava/lang/String;Ljava/lang/String;)[B

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    :cond_9
    if-eqz v3, :cond_a

    .line 248
    .line 249
    array-length v0, v3

    .line 250
    if-nez v0, :cond_b

    .line 251
    .line 252
    :cond_a
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    const-string v3, "wallpaper/wallpaper1.jpg"

    .line 257
    .line 258
    invoke-static {v0, v3}, Lcom/android/launcher3/resource/K;->k(Ljava/lang/String;Ljava/lang/String;)[B

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    :cond_b
    invoke-virtual {p0, v3}, Lcom/android/launcher3/resource/g0;->N2([B)Z

    .line 263
    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_c
    invoke-static {v2, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0, v4}, Lcom/android/launcher3/resource/K$d;->c(Lcom/android/launcher3/resource/K$e;)V

    .line 270
    .line 271
    .line 272
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 277
    .line 278
    .line 279
    goto :goto_3

    .line 280
    :cond_d
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    const/4 v3, 0x2

    .line 285
    if-ne v3, v0, :cond_e

    .line 286
    .line 287
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->n:Lcom/android/launcher3/resource/G1;

    .line 296
    .line 297
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/G1;->z(Landroid/content/ComponentName;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 298
    .line 299
    .line 300
    goto :goto_3

    .line 301
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .line 305
    .line 306
    const-string v3, "setWallpaper "

    .line 307
    .line 308
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string p1, "src not found! Detail:"

    .line 315
    .line 316
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    .line 332
    .line 333
    :cond_e
    :goto_3
    return v1
.end method
