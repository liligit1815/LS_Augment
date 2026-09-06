.class public final Lz1/W4;
.super Ljava/lang/Object;
.source "WellbeingModel.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# static fields
.field private static final q:[I

.field public static final r:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lz1/W4;",
            ">;"
        }
    .end annotation
.end field

.field public static final s:Lcom/android/launcher3/popup/P$i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/views/k;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Landroid/content/Context;

.field private final h:Ljava/lang/String;

.field private final i:Landroid/os/Handler;

.field private final j:Landroid/database/ContentObserver;

.field private final k:Lcom/android/launcher3/util/x2;

.field private final l:Lcom/android/launcher3/util/x2;

.field private final m:Ljava/lang/Object;

.field private final n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/app/RemoteAction;",
            ">;"
        }
    .end annotation
.end field

.field private final o:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/16 v0, 0x3a98

    .line 2
    .line 3
    const/16 v1, 0x7530

    .line 4
    .line 5
    const/16 v2, 0x1388

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lz1/W4;->q:[I

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 14
    .line 15
    new-instance v1, Lz1/M4;

    .line 16
    .line 17
    invoke-direct {v1}, Lz1/M4;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lz1/W4;->r:Lcom/android/launcher3/util/I;

    .line 24
    .line 25
    new-instance v0, Lz1/N4;

    .line 26
    .line 27
    invoke-direct {v0}, Lz1/N4;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lz1/W4;->s:Lcom/android/launcher3/popup/P$i;

    .line 31
    .line 32
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lz1/W4;->m:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Landroid/util/ArrayMap;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lz1/W4;->n:Ljava/util/Map;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lz1/W4;->o:Ljava/util/Map;

    .line 24
    .line 25
    iput-object p1, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 26
    .line 27
    const v0, 0x7f140477

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lz1/W4;->h:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v1, Landroid/os/Handler;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v0}, Lcom/android/launcher3/util/m0;->a(Ljava/lang/String;)Lcom/android/launcher3/util/p1;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 63
    .line 64
    new-instance v0, Lcom/android/launcher3/util/x2;

    .line 65
    .line 66
    new-instance v2, Lz1/P4;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Lz1/P4;-><init>(Lz1/W4;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {v0, p1, v1, v2}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/util/function/Consumer;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lz1/W4;->k:Lcom/android/launcher3/util/x2;

    .line 75
    .line 76
    new-instance v0, Lcom/android/launcher3/util/x2;

    .line 77
    .line 78
    new-instance v2, Lz1/Q4;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Lz1/Q4;-><init>(Lz1/W4;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {v0, p1, v1, v2}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/util/function/Consumer;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lz1/W4;->l:Lcom/android/launcher3/util/x2;

    .line 87
    .line 88
    new-instance p1, Lz1/W4$a;

    .line 89
    .line 90
    invoke-direct {p1, p0, v1}, Lz1/W4$a;-><init>(Lz1/W4;Landroid/os/Handler;)V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Lz1/W4;->j:Landroid/database/ContentObserver;

    .line 94
    .line 95
    new-instance p1, Lz1/R4;

    .line 96
    .line 97
    invoke-direct {p1, p0}, Lz1/R4;-><init>(Lz1/W4;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private A(Ljava/lang/String;ILandroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    iget-boolean p0, p0, Lz1/W4;->p:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "WellbeingModel"

    .line 16
    .line 17
    new-instance p2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string p3, "getShortcutForApp ["

    .line 23
    .line 24
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, "]: not current user"

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    return-object v1

    .line 43
    :cond_1
    iget-object p2, p0, Lz1/W4;->m:Ljava/lang/Object;

    .line 44
    .line 45
    monitor-enter p2

    .line 46
    :try_start_0
    iget-object v0, p0, Lz1/W4;->o:Ljava/util/Map;

    .line 47
    .line 48
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v2, p0, Lz1/W4;->n:Ljava/util/Map;

    .line 57
    .line 58
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Landroid/app/RemoteAction;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move-object v0, v1

    .line 68
    :goto_0
    if-nez v0, :cond_4

    .line 69
    .line 70
    iget-boolean p0, p0, Lz1/W4;->p:Z

    .line 71
    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    const-string p0, "WellbeingModel"

    .line 75
    .line 76
    new-instance p3, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string p4, "getShortcutForApp ["

    .line 82
    .line 83
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p1, "]: no action"

    .line 90
    .line 91
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    :cond_3
    monitor-exit p2

    .line 102
    return-object v1

    .line 103
    :cond_4
    iget-boolean p0, p0, Lz1/W4;->p:Z

    .line 104
    .line 105
    if-eqz p0, :cond_5

    .line 106
    .line 107
    const-string p0, "WellbeingModel"

    .line 108
    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v2, "getShortcutForApp ["

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p1, "]: action: \'"

    .line 123
    .line 124
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/app/RemoteAction;->getTitle()Ljava/lang/CharSequence;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p1, "\'"

    .line 135
    .line 136
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :cond_5
    new-instance p0, Lcom/android/launcher3/popup/z;

    .line 147
    .line 148
    invoke-direct {p0, v0, p3, p4, p5}, Lcom/android/launcher3/popup/z;-><init>(Landroid/app/RemoteAction;Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 149
    .line 150
    .line 151
    monitor-exit p2

    .line 152
    return-object p0

    .line 153
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    throw p0
.end method

.method private B()V
    .locals 15

    .line 1
    iget-object v0, p0, Lz1/W4;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 10
    .line 11
    iget-object v2, p0, Lz1/W4;->k:Lcom/android/launcher3/util/x2;

    .line 12
    .line 13
    iget-object v0, p0, Lz1/W4;->h:Ljava/lang/String;

    .line 14
    .line 15
    const-string v3, "android.intent.action.PACKAGE_DATA_CLEARED"

    .line 16
    .line 17
    const-string v4, "android.intent.action.PACKAGE_RESTARTED"

    .line 18
    .line 19
    const-string v7, "android.intent.action.PACKAGE_ADDED"

    .line 20
    .line 21
    const-string v5, "android.intent.action.PACKAGE_CHANGED"

    .line 22
    .line 23
    const-string v8, "android.intent.action.PACKAGE_REMOVED"

    .line 24
    .line 25
    filled-new-array {v7, v5, v8, v3, v4}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v0, v3}, Lcom/android/launcher3/util/x2;->g(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget-object v5, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 34
    .line 35
    const/4 v6, 0x2

    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-virtual/range {v1 .. v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    new-instance v11, Landroid/content/IntentFilter;

    .line 41
    .line 42
    invoke-direct {v11, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v11, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v0, "package"

    .line 49
    .line 50
    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v9, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 54
    .line 55
    iget-object v10, p0, Lz1/W4;->l:Lcom/android/launcher3/util/x2;

    .line 56
    .line 57
    iget-object v13, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 58
    .line 59
    const/4 v14, 0x2

    .line 60
    const/4 v12, 0x0

    .line 61
    invoke-virtual/range {v9 .. v14}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Lz1/W4;->I()V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method private synthetic C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/W4;->k:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/x2;->v()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lz1/W4;->l:Lcom/android/launcher3/util/x2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/util/x2;->v()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lz1/W4;->j:Landroid/database/ContentObserver;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic D(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/W4;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic E(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lz1/W4;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "Retrying; attempt "

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    add-int/lit8 v1, p1, 0x1

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "WellbeingModel"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 30
    .line 31
    invoke-direct {p0, p1, p2}, Lz1/W4;->L(ILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private F(Landroid/content/Intent;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lz1/W4;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "WellbeingModel"

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "Changes in apps: intent = ["

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, "]"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {}, Lcom/android/launcher3/util/U1;->a()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lz1/W4;->m:Ljava/lang/Object;

    .line 70
    .line 71
    monitor-enter v1

    .line 72
    :try_start_0
    iget-object p0, p0, Lz1/W4;->o:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    monitor-exit v1

    .line 78
    return-void

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    throw p0

    .line 82
    :cond_2
    const-string v1, "android.intent.action.PACKAGE_ADDED"

    .line 83
    .line 84
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    const/4 p1, 0x0

    .line 91
    invoke-direct {p0, p1, v0}, Lz1/W4;->L(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_0
    return-void
.end method

.method private I()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lz1/W4;->j:Landroid/database/ContentObserver;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lz1/W4;->w()Landroid/net/Uri$Builder;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "actions"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :try_start_0
    iget-object v2, p0, Lz1/W4;->j:Landroid/database/ContentObserver;

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception v0

    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v3, "Failed to register content observer for "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, ": "

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "WellbeingModel"

    .line 60
    .line 61
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    iget-boolean v1, p0, Lz1/W4;->p:Z

    .line 65
    .line 66
    if-nez v1, :cond_0

    .line 67
    .line 68
    :goto_0
    invoke-direct {p0}, Lz1/W4;->M()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 73
    .line 74
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    throw p0
.end method

.method private J([Ljava/lang/String;)Z
    .locals 14

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return v1

    .line 6
    :cond_0
    iget-boolean v0, p0, Lz1/W4;->p:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const-string v0, "WellbeingModel"

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v3, "retrieveActions() called with: packageNames = ["

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v3, ", "

    .line 23
    .line 24
    invoke-static {v3, p1}, Ljava/lang/String;->join(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, "]"

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-static {}, Lcom/android/launcher3/util/U1;->a()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lz1/W4;->w()Landroid/net/Uri$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v2, 0x0

    .line 55
    :try_start_0
    iget-object v3, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3, v0}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 62
    .line 63
    .line 64
    move-result-object v3
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    if-nez v3, :cond_4

    .line 66
    .line 67
    :try_start_1
    iget-boolean p1, p0, Lz1/W4;->p:Z

    .line 68
    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    const-string p1, "WellbeingModel"

    .line 72
    .line 73
    const-string v4, "retrieveActions(): null provider"

    .line 74
    .line 75
    invoke-static {p1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p1

    .line 80
    goto/16 :goto_7

    .line 81
    .line 82
    :cond_2
    :goto_0
    if-eqz v3, :cond_3

    .line 83
    .line 84
    :goto_1
    :try_start_2
    invoke-virtual {v3}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 85
    .line 86
    .line 87
    return v2

    .line 88
    :catch_0
    move-exception p1

    .line 89
    goto/16 :goto_9

    .line 90
    .line 91
    :cond_3
    return v2

    .line 92
    :cond_4
    :try_start_3
    new-instance v4, Landroid/os/Bundle;

    .line 93
    .line 94
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v5, "packages"

    .line 98
    .line 99
    invoke-virtual {v4, v5, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    const-string v5, "max_num_actions_shown"

    .line 103
    .line 104
    invoke-virtual {v4, v5, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    const-string v5, "get_actions"

    .line 108
    .line 109
    const/4 v6, 0x0

    .line 110
    invoke-virtual {v3, v5, v6, v4}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    if-eqz v4, :cond_5

    .line 115
    .line 116
    const-string v5, "success"

    .line 117
    .line 118
    invoke-virtual {v4, v5, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    if-nez v5, :cond_5

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_5
    iget-object v5, p0, Lz1/W4;->m:Ljava/lang/Object;

    .line 126
    .line 127
    monitor-enter v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 128
    :try_start_4
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iget-object v6, p0, Lz1/W4;->o:Ljava/util/Map;

    .line 133
    .line 134
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    new-instance v7, Lz1/V4;

    .line 138
    .line 139
    invoke-direct {v7, v6}, Lz1/V4;-><init>(Ljava/util/Map;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {p1, v7}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 143
    .line 144
    .line 145
    if-eqz v4, :cond_d

    .line 146
    .line 147
    const-string p1, "actions"

    .line 148
    .line 149
    invoke-virtual {v4, p1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    if-nez p1, :cond_6

    .line 154
    .line 155
    goto/16 :goto_5

    .line 156
    .line 157
    :cond_6
    const-string p1, "actions"

    .line 158
    .line 159
    invoke-virtual {v4, p1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    array-length v6, p1

    .line 164
    move v7, v2

    .line 165
    :goto_2
    if-ge v7, v6, :cond_b

    .line 166
    .line 167
    aget-object v8, p1, v7

    .line 168
    .line 169
    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    if-nez v9, :cond_7

    .line 174
    .line 175
    const-string v8, "WellbeingModel"

    .line 176
    .line 177
    const-string v9, "updateActions--actionBundle == null"

    .line 178
    .line 179
    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    goto :goto_4

    .line 183
    :catchall_1
    move-exception p1

    .line 184
    goto/16 :goto_6

    .line 185
    .line 186
    :cond_7
    iget-object v10, p0, Lz1/W4;->n:Ljava/util/Map;

    .line 187
    .line 188
    const-string v11, "action"

    .line 189
    .line 190
    invoke-virtual {v9, v11}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 191
    .line 192
    .line 193
    move-result-object v11

    .line 194
    check-cast v11, Landroid/app/RemoteAction;

    .line 195
    .line 196
    invoke-interface {v10, v8, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    const-string v10, "packages"

    .line 200
    .line 201
    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v9

    .line 205
    if-nez v9, :cond_8

    .line 206
    .line 207
    const-string v8, "WellbeingModel"

    .line 208
    .line 209
    const-string v9, "updateActions--packagesForAction == null"

    .line 210
    .line 211
    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    .line 213
    .line 214
    goto :goto_4

    .line 215
    :cond_8
    iget-boolean v10, p0, Lz1/W4;->p:Z

    .line 216
    .line 217
    if-eqz v10, :cond_9

    .line 218
    .line 219
    const-string v10, "WellbeingModel"

    .line 220
    .line 221
    new-instance v11, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string v12, "....actionId: "

    .line 227
    .line 228
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string v12, ", packages: "

    .line 235
    .line 236
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v12, ", "

    .line 240
    .line 241
    invoke-static {v12, v9}, Ljava/lang/String;->join(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v12

    .line 245
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v11

    .line 252
    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    :cond_9
    array-length v10, v9

    .line 256
    move v11, v2

    .line 257
    :goto_3
    if-ge v11, v10, :cond_a

    .line 258
    .line 259
    aget-object v12, v9, v11

    .line 260
    .line 261
    iget-object v13, p0, Lz1/W4;->o:Ljava/util/Map;

    .line 262
    .line 263
    invoke-interface {v13, v12, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    add-int/lit8 v11, v11, 0x1

    .line 267
    .line 268
    goto :goto_3

    .line 269
    :cond_a
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 270
    .line 271
    goto :goto_2

    .line 272
    :cond_b
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 273
    :try_start_5
    invoke-virtual {v3}, Landroid/content/ContentProviderClient;->close()V
    :try_end_5
    .catch Landroid/os/DeadObjectException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 274
    .line 275
    .line 276
    iget-boolean p0, p0, Lz1/W4;->p:Z

    .line 277
    .line 278
    if-eqz p0, :cond_c

    .line 279
    .line 280
    const-string p0, "WellbeingModel"

    .line 281
    .line 282
    const-string p1, "retrieveActions(): finished"

    .line 283
    .line 284
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    .line 286
    .line 287
    :cond_c
    return v1

    .line 288
    :cond_d
    :goto_5
    :try_start_6
    const-string p1, "WellbeingModel"

    .line 289
    .line 290
    const-string v4, "updateActions--remoteActionBundle == null"

    .line 291
    .line 292
    invoke-static {p1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    monitor-exit v5

    .line 296
    goto/16 :goto_1

    .line 297
    .line 298
    :goto_6
    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 299
    :try_start_7
    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 300
    :goto_7
    if-eqz v3, :cond_e

    .line 301
    .line 302
    :try_start_8
    invoke-virtual {v3}, Landroid/content/ContentProviderClient;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 303
    .line 304
    .line 305
    goto :goto_8

    .line 306
    :catchall_2
    move-exception v3

    .line 307
    :try_start_9
    invoke-virtual {p1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 308
    .line 309
    .line 310
    :cond_e
    :goto_8
    throw p1
    :try_end_9
    .catch Landroid/os/DeadObjectException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 311
    :goto_9
    const-string v2, "WellbeingModel"

    .line 312
    .line 313
    new-instance v3, Ljava/lang/StringBuilder;

    .line 314
    .line 315
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 316
    .line 317
    .line 318
    const-string v4, "Failed to retrieve data from "

    .line 319
    .line 320
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    const-string v0, ": "

    .line 327
    .line 328
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    .line 340
    .line 341
    iget-boolean p0, p0, Lz1/W4;->p:Z

    .line 342
    .line 343
    if-nez p0, :cond_f

    .line 344
    .line 345
    return v1

    .line 346
    :cond_f
    new-instance p0, Ljava/lang/RuntimeException;

    .line 347
    .line 348
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 349
    .line 350
    .line 351
    throw p0

    .line 352
    :catch_1
    const-string p0, "WellbeingModel"

    .line 353
    .line 354
    const-string p1, "retrieveActions(): DeadObjectException"

    .line 355
    .line 356
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    .line 358
    .line 359
    return v2
.end method

.method private L(ILjava/lang/String;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lz1/W4;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "updateActionsWithRetry(); retryCount: "

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ", package: "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "WellbeingModel"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lz1/W4;->g:Landroid/content/Context;

    .line 42
    .line 43
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Lz1/S4;

    .line 65
    .line 66
    invoke-direct {v1}, Lz1/S4;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Ljava/util/stream/Stream;->distinct()Ljava/util/stream/Stream;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Lz1/T4;

    .line 78
    .line 79
    invoke-direct {v1}, Lz1/T4;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, [Ljava/lang/String;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const/4 v0, 0x1

    .line 90
    new-array v0, v0, [Ljava/lang/String;

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    aput-object p2, v0, v1

    .line 94
    .line 95
    :goto_0
    iget-object v1, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 96
    .line 97
    invoke-virtual {v1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, v0}, Lz1/W4;->J([Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    sget-object v0, Lz1/W4;->q:[I

    .line 108
    .line 109
    array-length v1, v0

    .line 110
    if-lt p1, v1, :cond_3

    .line 111
    .line 112
    :goto_1
    return-void

    .line 113
    :cond_3
    iget-object v1, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 114
    .line 115
    new-instance v2, Lz1/U4;

    .line 116
    .line 117
    invoke-direct {v2, p0, p1, p2}, Lz1/U4;-><init>(Lz1/W4;ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    aget p0, v0, p1

    .line 121
    .line 122
    int-to-long p0, p0

    .line 123
    invoke-virtual {v1, v2, p2, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method private M()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lz1/W4;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "WellbeingModel"

    .line 6
    .line 7
    const-string v1, "updateAllPackages"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {p0, v0, v1}, Lz1/W4;->L(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic b(Lz1/W4;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/W4;->D(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(I)[Ljava/lang/String;
    .locals 0

    .line 1
    new-array p0, p0, [Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lz1/W4;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/W4;->E(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lz1/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/W4;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lz1/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/W4;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Landroid/content/pm/LauncherActivityInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic n(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sget-object p0, Lz1/W4;->r:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    move-object v0, p0

    .line 20
    check-cast v0, Lz1/W4;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object p0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    move-object v4, p1

    .line 45
    move-object v5, p2

    .line 46
    invoke-direct/range {v0 .. v5}, Lz1/W4;->A(Ljava/lang/String;ILandroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static synthetic t(Lz1/W4;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/W4;->F(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic v(Lz1/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/W4;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private w()Landroid/net/Uri$Builder;
    .locals 2

    .line 1
    new-instance v0, Landroid/net/Uri$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "content"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lz1/W4;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p0, ".api"

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/W4;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lz1/W4;->i:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Lz1/O4;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lz1/O4;-><init>(Lz1/W4;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
