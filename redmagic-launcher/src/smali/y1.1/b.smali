.class public Ly1/b;
.super Ljava/lang/Object;
.source "LauncherClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ly1/b$g;,
        Ly1/b$e;,
        Ly1/b$f;,
        Ly1/b$d;,
        Ly1/b$c;
    }
.end annotation


# static fields
.field public static u:Ljava/lang/String;

.field private static volatile v:Ly1/b$c;

.field private static volatile w:Ljava/lang/String;

.field private static volatile x:Ljava/lang/String;

.field private static volatile y:Ljava/lang/String;


# instance fields
.field private a:Ljava/lang/String;

.field private final b:Landroid/app/Activity;

.field private c:Ly1/b$e;

.field private d:Z

.field private e:Z

.field private f:Ly1/d;

.field private g:La4/a;

.field private h:Ly1/b$g;

.field private i:I

.field private final j:Landroid/content/Intent;

.field private k:I

.field private l:I

.field private final m:Landroid/content/BroadcastReceiver;

.field private n:Landroid/view/WindowManager$LayoutParams;

.field private o:Z

.field private p:I

.field private q:I

.field private r:Ljava/lang/Boolean;

.field protected s:Z

.field private t:Ly1/b$f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 2
    .line 3
    sput-object v0, Ly1/b;->u:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    sput-object v0, Ly1/b;->w:Ljava/lang/String;

    .line 8
    .line 9
    sput-object v0, Ly1/b;->x:Ljava/lang/String;

    .line 10
    .line 11
    sput-object v0, Ly1/b;->y:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ly1/d;Ljava/lang/String;Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    const-string v0, "LauncherClient"

    iput-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Ly1/b;->o:Z

    .line 4
    iput v0, p0, Ly1/b;->p:I

    .line 5
    iput v0, p0, Ly1/b;->q:I

    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Ly1/b;->r:Ljava/lang/Boolean;

    .line 7
    new-instance v2, Ly1/b$a;

    invoke-direct {v2, p0}, Ly1/b$a;-><init>(Ly1/b;)V

    iput-object v2, p0, Ly1/b;->m:Landroid/content/BroadcastReceiver;

    .line 8
    iput-boolean v0, p0, Ly1/b;->e:Z

    .line 9
    iput-boolean v0, p0, Ly1/b;->d:Z

    .line 10
    iput v0, p0, Ly1/b;->k:I

    .line 11
    iput-object p1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 12
    invoke-static {p1, p3}, Ly1/b;->t(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    iput-object v3, p0, Ly1/b;->j:Landroid/content/Intent;

    .line 13
    iput-object p2, p0, Ly1/b;->f:Ly1/d;

    .line 14
    iput v0, p0, Ly1/b;->l:I

    .line 15
    new-instance p2, Ly1/b$g;

    invoke-direct {p2, p0, v1}, Ly1/b$g;-><init>(Ly1/b;Ly1/c;)V

    iput-object p2, p0, Ly1/b;->h:Ly1/b$g;

    const/4 p2, 0x2

    if-eqz p4, :cond_0

    const/4 p4, 0x3

    goto :goto_0

    :cond_0
    move p4, p2

    .line 16
    :goto_0
    iput p4, p0, Ly1/b;->i:I

    .line 17
    invoke-direct {p0}, Ly1/b;->s()Ljava/lang/String;

    move-result-object p4

    sput-object p4, Ly1/b;->y:Ljava/lang/String;

    .line 18
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LauncherClient{@"

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ly1/b;->r()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}Launcher{@"

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ly1/b;->s()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Ly1/b;->a:Ljava/lang/String;

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LauncherClient init, sCurLauncherHexString="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ly1/b;->y:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    new-instance p4, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {p4, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 21
    const-string v1, "android.intent.action.PACKAGE_DATA_CLEARED"

    invoke-virtual {p4, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 22
    const-string v1, "package"

    invoke-virtual {p4, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 23
    invoke-virtual {p4, p3, v0}, Landroid/content/IntentFilter;->addDataSchemeSpecificPart(Ljava/lang/String;I)V

    .line 24
    invoke-virtual {p1, v2, p4, p2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 25
    invoke-virtual {p0}, Ly1/b;->J()V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ly1/d;Z)V
    .locals 1

    .line 26
    sget-object v0, Ly1/b;->u:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0, p3}, Ly1/b;-><init>(Landroid/app/Activity;Ly1/d;Ljava/lang/String;Z)V

    return-void
.end method

.method private K()V
    .locals 6

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "removeClient() called mState="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget v2, p0, Ly1/b;->l:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Ly1/b;->d:Z

    .line 27
    .line 28
    iget v1, p0, Ly1/b;->l:I

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    const/4 v3, 0x0

    .line 32
    if-ne v1, v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v4, "removeClient unbindService mServiceConnection mState="

    .line 42
    .line 43
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v4, p0, Ly1/b;->l:I

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    :try_start_0
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 59
    .line 60
    iget-object v1, p0, Ly1/b;->h:Ly1/b$g;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    iget-object v1, p0, Ly1/b;->a:Ljava/lang/String;

    .line 68
    .line 69
    new-instance v4, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v5, "removeClient unbindService mServiceConnection error, mState="

    .line 75
    .line 76
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget v5, p0, Ly1/b;->l:I

    .line 80
    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    .line 90
    .line 91
    :goto_0
    iput-object v3, p0, Ly1/b;->h:Ly1/b$g;

    .line 92
    .line 93
    iput v2, p0, Ly1/b;->l:I

    .line 94
    .line 95
    iput-object v3, p0, Ly1/b;->g:La4/a;

    .line 96
    .line 97
    invoke-direct {p0, v2}, Ly1/b;->w(I)V

    .line 98
    .line 99
    .line 100
    :cond_0
    :try_start_1
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 101
    .line 102
    iget-object v1, p0, Ly1/b;->m:Landroid/content/BroadcastReceiver;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :catchall_1
    move-exception v0

    .line 109
    iget-object v1, p0, Ly1/b;->a:Ljava/lang/String;

    .line 110
    .line 111
    new-instance v4, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v5, "removeClient unregisterReceiver mUpdateReceiver error, mState="

    .line 117
    .line 118
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget v5, p0, Ly1/b;->l:I

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .line 132
    .line 133
    :goto_1
    iget-object v0, p0, Ly1/b;->c:Ly1/b$e;

    .line 134
    .line 135
    if-eqz v0, :cond_1

    .line 136
    .line 137
    iput-object v3, p0, Ly1/b;->c:Ly1/b$e;

    .line 138
    .line 139
    :cond_1
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 140
    .line 141
    if-eqz v0, :cond_2

    .line 142
    .line 143
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 144
    .line 145
    iget-boolean v0, v0, Ly1/b$c;->h:Z

    .line 146
    .line 147
    if-eqz v0, :cond_2

    .line 148
    .line 149
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 150
    .line 151
    const-string v1, "removeClient sApplicationConnection unbindService set to null"

    .line 152
    .line 153
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    :try_start_2
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sget-object v1, Ly1/b;->v:Ly1/b$c;

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 165
    .line 166
    .line 167
    goto :goto_2

    .line 168
    :catchall_2
    move-exception v0

    .line 169
    iget-object v1, p0, Ly1/b;->a:Ljava/lang/String;

    .line 170
    .line 171
    new-instance v4, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v5, "removeClient unbindService sApplicationConnection error, mState="

    .line 177
    .line 178
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget v5, p0, Ly1/b;->l:I

    .line 182
    .line 183
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 191
    .line 192
    .line 193
    :goto_2
    sput-object v3, Ly1/b;->v:Ly1/b$c;

    .line 194
    .line 195
    iput v2, p0, Ly1/b;->l:I

    .line 196
    .line 197
    :cond_2
    return-void
.end method

.method private L(Landroid/view/WindowManager$LayoutParams;)V
    .locals 7

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, " sAttachedLauncherClient="

    .line 4
    .line 5
    const-string v2, " sAttachedLauncherHexString="

    .line 6
    .line 7
    const-string v3, " sLatestLauncherHexString="

    .line 8
    .line 9
    iput-object p1, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Ly1/b;->n()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ly1/b;->g:La4/a;

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    :try_start_0
    invoke-direct {p0}, Ly1/b;->s()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v4, p0, Ly1/b;->a:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v5, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v6, "setWindowAttrs windowDetached launcherHexString="

    .line 33
    .line 34
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    sget-object v6, Ly1/b;->y:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    sget-object v6, Ly1/b;->x:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    sget-object v6, Ly1/b;->w:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    sget-object v4, Ly1/b;->y:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-nez v4, :cond_1

    .line 78
    .line 79
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-nez v4, :cond_1

    .line 84
    .line 85
    sget-object v4, Ly1/b;->y:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-nez v4, :cond_1

    .line 92
    .line 93
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 94
    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v2, "setWindowAttrs windowDetached not latest launcher, return, launcherHexString="

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    sget-object p1, Ly1/b;->y:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :catch_0
    move-exception p1

    .line 125
    goto :goto_0

    .line 126
    :cond_1
    sput-object v0, Ly1/b;->w:Ljava/lang/String;

    .line 127
    .line 128
    sput-object v0, Ly1/b;->x:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 131
    .line 132
    iget-object v4, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 133
    .line 134
    invoke-virtual {v4}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    invoke-interface {v0, v4}, La4/a;->p(Z)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 142
    .line 143
    new-instance v4, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v5, "setWindowAttrs windowDetached done launcherHexString="

    .line 149
    .line 150
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    sget-object p1, Ly1/b;->y:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    sget-object p1, Ly1/b;->x:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    sget-object p1, Ly1/b;->w:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    .line 186
    .line 187
    goto :goto_1

    .line 188
    :goto_0
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 189
    .line 190
    const-string v1, "setWindowAttrs windowDetached error."

    .line 191
    .line 192
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 193
    .line 194
    .line 195
    :goto_1
    const/4 p1, 0x0

    .line 196
    iput-object p1, p0, Ly1/b;->g:La4/a;

    .line 197
    .line 198
    :cond_2
    return-void
.end method

.method static bridge synthetic a(Ly1/b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Ly1/b;)Landroid/app/Activity;
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Ly1/b;)Ly1/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->f:Ly1/d;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Ly1/b;)La4/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->g:La4/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Ly1/b;)I
    .locals 0

    .line 1
    iget p0, p0, Ly1/b;->k:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Ly1/b;)Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Ly1/b;La4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly1/b;->g:La4/a;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Ly1/b;I)V
    .locals 0

    .line 1
    iput p1, p0, Ly1/b;->l:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Ly1/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ly1/b;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic j(Ly1/b;Lcom/android/launcher3/C2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ly1/b;->u(Lcom/android/launcher3/C2;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k(Ly1/b;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ly1/b;->w(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic l()Ly1/b$c;
    .locals 1

    .line 1
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic m(Ly1/b$c;)V
    .locals 0

    .line 1
    sput-object p0, Ly1/b;->v:Ly1/b$c;

    .line 2
    .line 3
    return-void
.end method

.method private n()V
    .locals 7

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "applyWindowToken() called"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Ly1/b;->s()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ly1/b;->a:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v3, "applyWindowToken before launcherHexString="

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v3, " sLatestLauncherHexString="

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    sget-object v4, Ly1/b;->y:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    sget-object v1, Ly1/b;->y:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_1

    .line 57
    .line 58
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    sget-object v1, Ly1/b;->y:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_1

    .line 71
    .line 72
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v2, "applyWindowToken not latest launcher, return, launcherHexString="

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    sget-object v0, Ly1/b;->y:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    :try_start_0
    iget-object v1, p0, Ly1/b;->c:Ly1/b$e;

    .line 104
    .line 105
    if-nez v1, :cond_2

    .line 106
    .line 107
    new-instance v1, Ly1/b$f;

    .line 108
    .line 109
    iget-object v2, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 110
    .line 111
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    new-instance v5, Ly1/b$d;

    .line 120
    .line 121
    const/4 v6, 0x0

    .line 122
    invoke-direct {v5, v6}, Ly1/b$d;-><init>(Ly1/c;)V

    .line 123
    .line 124
    .line 125
    invoke-direct {v1, v2, v4, v5}, Ly1/b$f;-><init>(Landroid/content/Context;Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 126
    .line 127
    .line 128
    iput-object v1, p0, Ly1/b;->t:Ly1/b$f;

    .line 129
    .line 130
    new-instance v1, Ly1/b$e;

    .line 131
    .line 132
    iget-object v2, p0, Ly1/b;->t:Ly1/b$f;

    .line 133
    .line 134
    invoke-direct {v1, v2}, Ly1/b$e;-><init>(Ly1/b$f;)V

    .line 135
    .line 136
    .line 137
    iput-object v1, p0, Ly1/b;->c:Ly1/b$e;

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :catch_0
    move-exception v0

    .line 141
    goto/16 :goto_2

    .line 142
    .line 143
    :cond_2
    :goto_0
    iget-object v1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 144
    .line 145
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iget-object v2, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Lcom/android/launcher3/r4;->B(Landroid/content/Context;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_3

    .line 160
    .line 161
    const/16 v1, 0xd

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_3
    const/16 v1, 0xc

    .line 165
    .line 166
    :goto_1
    or-int/lit16 v2, v1, 0x80

    .line 167
    .line 168
    invoke-static {}, Lx1/c0;->d()Z

    .line 169
    .line 170
    .line 171
    move-result v4

    .line 172
    if-nez v4, :cond_4

    .line 173
    .line 174
    invoke-static {}, Lx1/O;->N1()Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-eqz v4, :cond_4

    .line 179
    .line 180
    or-int/lit16 v2, v1, 0xa0

    .line 181
    .line 182
    :cond_4
    iget-object v1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 183
    .line 184
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    if-eqz v1, :cond_5

    .line 189
    .line 190
    iget-object v1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 191
    .line 192
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    if-eqz v1, :cond_5

    .line 201
    .line 202
    iget-object v1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 203
    .line 204
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v1}, Lcom/android/launcher3/r4;->w()Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-eqz v1, :cond_5

    .line 217
    .line 218
    iget-object v1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 219
    .line 220
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iget-object v4, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 229
    .line 230
    invoke-virtual {v1, v4}, Lcom/android/launcher3/r4;->C(Landroid/content/Context;)Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-nez v1, :cond_5

    .line 235
    .line 236
    or-int/lit8 v2, v2, 0x40

    .line 237
    .line 238
    :cond_5
    iget-object v1, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 239
    .line 240
    check-cast v1, Lcom/android/launcher3/C2;

    .line 241
    .line 242
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getForeColor()I

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    const/4 v4, 0x1

    .line 247
    const/4 v5, 0x0

    .line 248
    invoke-virtual {p0, v1, v5, v4}, Ly1/b;->z(IZZ)V

    .line 249
    .line 250
    .line 251
    iget v1, p0, Ly1/b;->q:I

    .line 252
    .line 253
    if-eqz v1, :cond_6

    .line 254
    .line 255
    invoke-virtual {p0, v1, v4, v5}, Ly1/b;->z(IZZ)V

    .line 256
    .line 257
    .line 258
    :cond_6
    invoke-direct {p0}, Ly1/b;->r()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    sput-object v1, Ly1/b;->w:Ljava/lang/String;

    .line 263
    .line 264
    invoke-direct {p0}, Ly1/b;->s()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    sput-object v1, Ly1/b;->x:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v1, p0, Ly1/b;->a:Ljava/lang/String;

    .line 271
    .line 272
    new-instance v4, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    .line 276
    .line 277
    const-string v6, "applyWindowToken launcherHexString="

    .line 278
    .line 279
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    sget-object v0, Ly1/b;->y:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v0, " sAttachedLauncherClient="

    .line 294
    .line 295
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    sget-object v0, Ly1/b;->w:Ljava/lang/String;

    .line 299
    .line 300
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v0, ", sAttachedLauncher="

    .line 304
    .line 305
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    sget-object v0, Ly1/b;->x:Ljava/lang/String;

    .line 309
    .line 310
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 321
    .line 322
    iget-object v1, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 323
    .line 324
    iget-object v1, v1, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 325
    .line 326
    iget-object v3, p0, Ly1/b;->c:Ly1/b$e;

    .line 327
    .line 328
    invoke-interface {v0, v1, v3, v2}, La4/a;->j1(Landroid/os/IBinder;La4/b;I)V

    .line 329
    .line 330
    .line 331
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 332
    .line 333
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    invoke-virtual {v0, v5}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 338
    .line 339
    .line 340
    iget-object v0, p0, Ly1/b;->r:Ljava/lang/Boolean;

    .line 341
    .line 342
    if-eqz v0, :cond_7

    .line 343
    .line 344
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    invoke-virtual {p0, v0}, Ly1/b;->C(Z)V

    .line 349
    .line 350
    .line 351
    :cond_7
    iget-boolean v0, p0, Ly1/b;->e:Z

    .line 352
    .line 353
    if-eqz v0, :cond_8

    .line 354
    .line 355
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 356
    .line 357
    invoke-interface {v0}, La4/a;->e()V

    .line 358
    .line 359
    .line 360
    return-void

    .line 361
    :cond_8
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 362
    .line 363
    invoke-interface {v0}, La4/a;->p1()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    .line 365
    .line 366
    return-void

    .line 367
    :goto_2
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 368
    .line 369
    const-string v1, "applyWindowToken error."

    .line 370
    .line 371
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 372
    .line 373
    .line 374
    :goto_3
    return-void
.end method

.method private p(Landroid/content/Context;Landroid/content/ServiceConnection;I)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Ly1/b;->j:Landroid/content/Intent;

    .line 3
    .line 4
    or-int/2addr p3, v0

    .line 5
    invoke-virtual {p1, v1, p2, p3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    return p0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    iget-object p3, p0, Ly1/b;->a:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "Unable to connect to overlay service, mServiceConnection="

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ly1/b;->h:Ly1/b$g;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-ne p2, p0, :cond_0

    .line 27
    .line 28
    move p0, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move p0, v2

    .line 31
    :goto_0
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, " sApplicationConnection="

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    sget-object p0, Ly1/b;->v:Ly1/b$c;

    .line 40
    .line 41
    if-ne p2, p0, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    move v0, v2

    .line 45
    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p3, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 53
    .line 54
    .line 55
    return v2
.end method

.method private r()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private s()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method private static t(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "app://"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p0, ":"

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "v"

    .line 48
    .line 49
    invoke-virtual {p0, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v0, Landroid/content/Intent;

    .line 58
    .line 59
    const-string v1, "com.android.launcher3.WINDOW_OVERLAY"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method private u(Lcom/android/launcher3/C2;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "goGlobalSearch httpUrl= "

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/android/launcher3/C2;->C2(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/b;->g:La4/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private w(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "notifyStatusChanged() called with: status = ["

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, "]"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget v0, p0, Ly1/b;->k:I

    .line 29
    .line 30
    if-ne v0, p1, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iput p1, p0, Ly1/b;->k:I

    .line 34
    .line 35
    iget-object p0, p0, Ly1/b;->f:Ly1/d;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    and-int/2addr p1, v0

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    move p1, v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 p1, 0x0

    .line 44
    :goto_0
    invoke-interface {p0, p1, v0}, Ly1/d;->b(ZZ)V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onDestroy() called"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0}, Ly1/b;->L(Landroid/view/WindowManager$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ly1/b;->K()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final B()V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onDetachedFromWindow mDestroyed="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean v2, p0, Ly1/b;->d:Z

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, v0}, Ly1/b;->L(Landroid/view/WindowManager$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public C(Z)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ly1/b;->r:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0}, Ly1/b;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 15
    .line 16
    invoke-interface {v0, p1}, La4/a;->Y1(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p1

    .line 21
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "onGlobalSearchVoiceEnable error."

    .line 24
    .line 25
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    :goto_0
    return-void
.end method

.method public D(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    invoke-interface {v0, p1}, La4/a;->j(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p1

    .line 11
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "onHomeIntent error."

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :goto_0
    return-void
.end method

.method public E(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/b;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 9
    .line 10
    invoke-interface {v0, p1}, La4/a;->z0(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p1

    .line 15
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "onLauncherCircleSwitchChanged error."

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :goto_0
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ly1/b;->e:Z

    .line 8
    .line 9
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    :try_start_0
    invoke-interface {v0}, La4/a;->p1()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception v0

    .line 22
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "onPause error."

    .line 25
    .line 26
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onResume mDestroyed= "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean v2, p0, Ly1/b;->d:Z

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ly1/b;->J()V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Ly1/b;->e:Z

    .line 35
    .line 36
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :try_start_0
    invoke-interface {v0}, La4/a;->e()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 49
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 50
    .line 51
    const-string v1, "onResume error."

    .line 52
    .line 53
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onStart() called"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ly1/b;->J()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 17
    .line 18
    check-cast v0, Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    :try_start_0
    invoke-interface {v0}, La4/a;->d()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception v0

    .line 40
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "onStart error."

    .line 43
    .line 44
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onStop() called"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Ly1/b;->n:Landroid/view/WindowManager$LayoutParams;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    :try_start_0
    invoke-interface {v0}, La4/a;->R1()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception v0

    .line 26
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "onStop error."

    .line 29
    .line 30
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public J()V
    .locals 6

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "reconnect mDestroyed= "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean v2, p0, Ly1/b;->d:Z

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " mState= "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget v2, p0, Ly1/b;->l:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, " (sApplicationConnection != null)= "

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    sget-object v2, Ly1/b;->v:Ly1/b$c;

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    const/4 v4, 0x0

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    move v2, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v2, v4

    .line 42
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    iget v0, p0, Ly1/b;->l:I

    .line 57
    .line 58
    if-ne v0, v3, :cond_2

    .line 59
    .line 60
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 61
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v1, "reconnect SERVICE_OVERLAY_CONNECTED return, sApplicationConnection="

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    sget-object v1, Ly1/b;->v:Ly1/b$c;

    .line 73
    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move v3, v4

    .line 78
    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 90
    .line 91
    if-nez v0, :cond_3

    .line 92
    .line 93
    iput v4, p0, Ly1/b;->l:I

    .line 94
    .line 95
    :cond_3
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    const/4 v2, 0x2

    .line 99
    if-nez v0, :cond_5

    .line 100
    .line 101
    iget v0, p0, Ly1/b;->l:I

    .line 102
    .line 103
    if-ne v0, v2, :cond_5

    .line 104
    .line 105
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 106
    .line 107
    const-string v3, "reconnect SERVICE_APP_CONNECTED"

    .line 108
    .line 109
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    iput v4, p0, Ly1/b;->l:I

    .line 113
    .line 114
    :try_start_0
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 115
    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 119
    .line 120
    iget-boolean v0, v0, Ly1/b$c;->h:Z

    .line 121
    .line 122
    if-eqz v0, :cond_4

    .line 123
    .line 124
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 125
    .line 126
    const-string v3, "reconnect SERVICE_APP_CONNECTED sApplicationConnection != null unbindService"

    .line 127
    .line 128
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sget-object v3, Ly1/b;->v:Ly1/b$c;

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :catchall_0
    move-exception v0

    .line 144
    iget-object v3, p0, Ly1/b;->a:Ljava/lang/String;

    .line 145
    .line 146
    const-string v5, "reconnect SERVICE_APP_CONNECTED sApplicationConnection != null unbindService error"

    .line 147
    .line 148
    invoke-static {v3, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 149
    .line 150
    .line 151
    :cond_4
    :goto_2
    sput-object v1, Ly1/b;->v:Ly1/b$c;

    .line 152
    .line 153
    :cond_5
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 154
    .line 155
    if-nez v0, :cond_a

    .line 156
    .line 157
    iget v0, p0, Ly1/b;->l:I

    .line 158
    .line 159
    if-eqz v0, :cond_6

    .line 160
    .line 161
    goto/16 :goto_3

    .line 162
    .line 163
    :cond_6
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 164
    .line 165
    if-eqz v0, :cond_7

    .line 166
    .line 167
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 168
    .line 169
    iget-object v0, v0, Ly1/b$c;->g:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, p0, Ly1/b;->j:Landroid/content/Intent;

    .line 172
    .line 173
    invoke-virtual {v3}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_7

    .line 182
    .line 183
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 184
    .line 185
    const-string v3, "reconnect sApplicationConnection != null and packageName not equals unbindService"

    .line 186
    .line 187
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 191
    .line 192
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    sget-object v3, Ly1/b;->v:Ly1/b$c;

    .line 197
    .line 198
    invoke-virtual {v0, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 199
    .line 200
    .line 201
    :cond_7
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 202
    .line 203
    if-nez v0, :cond_8

    .line 204
    .line 205
    new-instance v0, Ly1/b$c;

    .line 206
    .line 207
    iget-object v3, p0, Ly1/b;->j:Landroid/content/Intent;

    .line 208
    .line 209
    invoke-virtual {v3}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    invoke-direct {v0, v3}, Ly1/b$c;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    sput-object v0, Ly1/b;->v:Ly1/b$c;

    .line 217
    .line 218
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 219
    .line 220
    new-instance v3, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    const-string v5, "reconnect connect to app, new sApplicationConnection=@"

    .line 226
    .line 227
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    sget-object v5, Ly1/b;->v:Ly1/b$c;

    .line 231
    .line 232
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 251
    .line 252
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    sget-object v3, Ly1/b;->v:Ly1/b$c;

    .line 257
    .line 258
    const/16 v5, 0x20

    .line 259
    .line 260
    invoke-direct {p0, v0, v3, v5}, Ly1/b;->p(Landroid/content/Context;Landroid/content/ServiceConnection;I)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_8

    .line 265
    .line 266
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 267
    .line 268
    const-string v3, "reconnect not connected for app"

    .line 269
    .line 270
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    sput-object v1, Ly1/b;->v:Ly1/b$c;

    .line 274
    .line 275
    iput v4, p0, Ly1/b;->l:I

    .line 276
    .line 277
    :cond_8
    sget-object v0, Ly1/b;->v:Ly1/b$c;

    .line 278
    .line 279
    if-eqz v0, :cond_9

    .line 280
    .line 281
    iput v2, p0, Ly1/b;->l:I

    .line 282
    .line 283
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 284
    .line 285
    const-string v1, "reconnect connect to miboard"

    .line 286
    .line 287
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 291
    .line 292
    iget-object v1, p0, Ly1/b;->h:Ly1/b$g;

    .line 293
    .line 294
    const/16 v2, 0x80

    .line 295
    .line 296
    invoke-direct {p0, v0, v1, v2}, Ly1/b;->p(Landroid/content/Context;Landroid/content/ServiceConnection;I)Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-nez v0, :cond_9

    .line 301
    .line 302
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 303
    .line 304
    const-string v1, "reconnect not connected for miboard"

    .line 305
    .line 306
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    .line 308
    .line 309
    iput v4, p0, Ly1/b;->l:I

    .line 310
    .line 311
    :cond_9
    iget v0, p0, Ly1/b;->l:I

    .line 312
    .line 313
    if-nez v0, :cond_a

    .line 314
    .line 315
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 316
    .line 317
    new-instance v1, Ly1/b$b;

    .line 318
    .line 319
    invoke-direct {v1, p0}, Ly1/b$b;-><init>(Ly1/b;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 323
    .line 324
    .line 325
    :cond_a
    :goto_3
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ly1/b;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 9
    .line 10
    invoke-interface {v0}, La4/a;->C1()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception v0

    .line 15
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "startMove error."

    .line 18
    .line 19
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :goto_0
    return-void
.end method

.method public N(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/b;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 9
    .line 10
    invoke-interface {v0, p1}, La4/a;->N1(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p1

    .line 15
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "updateMove error."

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :goto_0
    return-void
.end method

.method public o(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    invoke-interface {v0, p1}, La4/a;->x0(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p1

    .line 11
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "closeOverlay error."

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :goto_0
    return-void
.end method

.method public q(ZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/b;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 9
    .line 10
    invoke-interface {v0, p1, p2}, La4/a;->t(ZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p1

    .line 15
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 16
    .line 17
    const-string p2, "endMove error."

    .line 18
    .line 19
    invoke-static {p0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :goto_0
    return-void
.end method

.method public final x()V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onAttachedToWindow mDestroyed="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean v2, p0, Ly1/b;->d:Z

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Ly1/b;->d:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ly1/b;->b:Landroid/app/Activity;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p0, v0}, Ly1/b;->L(Landroid/view/WindowManager$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-interface {v0, v1, v2, v2}, La4/a;->i(IZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "onBackPressed error."

    .line 13
    .line 14
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public z(IZZ)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iput p1, p0, Ly1/b;->q:I

    .line 4
    .line 5
    :cond_0
    if-eqz p3, :cond_1

    .line 6
    .line 7
    iput p1, p0, Ly1/b;->p:I

    .line 8
    .line 9
    :cond_1
    invoke-direct {p0}, Ly1/b;->v()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_2
    iget-object v0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ly1/b;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, " onColorChanged color=0x"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, ", isStatusColor="

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, " isForeColor="

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    :try_start_0
    iget-object v0, p0, Ly1/b;->g:La4/a;

    .line 64
    .line 65
    invoke-interface {v0, p1, p2, p3}, La4/a;->i(IZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catch_0
    move-exception p1

    .line 70
    iget-object p0, p0, Ly1/b;->a:Ljava/lang/String;

    .line 71
    .line 72
    const-string p2, "onColorChanged error."

    .line 73
    .line 74
    invoke-static {p0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 75
    .line 76
    .line 77
    :goto_0
    return-void
.end method
