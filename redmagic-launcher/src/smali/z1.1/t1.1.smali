.class public Lz1/t1;
.super Ljava/lang/Object;
.source "ItemInstallQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/t1$a;
    }
.end annotation


# static fields
.field public static f:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lz1/t1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lcom/android/launcher3/util/R1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/R1<",
            "Lz1/t1$a;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Landroid/content/Context;

.field private c:I

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/t1$a;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lz1/j1;

    .line 4
    .line 5
    invoke-direct {v1}, Lz1/j1;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/R1;

    .line 5
    .line 6
    const-string v1, "apps_to_install"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/R1;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lz1/t1;->c:I

    .line 15
    .line 16
    iput-object p1, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 17
    .line 18
    return-void
.end method

.method private A(Lz1/t1$a;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lz1/l1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lz1/l1;-><init>(Lz1/t1;Lz1/t1$a;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lz1/t1;->n()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Landroid/os/UserHandle;Ljava/util/HashSet;Lz1/t1$a;)Z
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p2, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 10
    .line 11
    invoke-static {p0}, Lz1/t1;->p(Landroid/content/Intent;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static synthetic b(Lz1/t1;Lz1/t1$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/t1;->u(Lz1/t1$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lz1/t1;Lz1/t1$a;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/t1;->t(Lz1/t1$a;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lz1/t1;ILandroid/os/UserHandle;Landroid/content/Intent;)Lz1/t1$a;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/t1;->j(ILandroid/os/UserHandle;Landroid/content/Intent;)Lz1/t1$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lz1/t1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/t1;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Landroid/os/UserHandle;Lz1/t1$a;)LN1/e;
    .locals 0

    .line 1
    iget-object p1, p1, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 2
    .line 3
    invoke-static {p1, p0}, LN1/e;->c(Landroid/content/Intent;Landroid/os/UserHandle;)LN1/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g(Landroid/os/UserHandle;Lz1/t1$a;)Z
    .locals 2

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public static synthetic h(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lz1/t1;->k(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lz1/t1;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lz1/t1;->l(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/android/launcher3/InstallShortcutReceiver;->k(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private i(Lz1/t1$a;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_2

    .line 4
    .line 5
    :cond_0
    invoke-direct {p0}, Lz1/t1;->m()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lz1/t1;->d:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p1, Lz1/t1$a;->j:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    move v0, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    :goto_0
    iget-object v2, p0, Lz1/t1;->d:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    iget-boolean v2, p1, Lz1/t1$a;->j:Z

    .line 33
    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    iget-object v2, p0, Lz1/t1;->d:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 52
    .line 53
    iget-object v3, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 54
    .line 55
    iget-object v4, p0, Lz1/t1;->d:Ljava/util/List;

    .line 56
    .line 57
    iget-object v5, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v3, v4, v5}, Lcom/android/launcher3/util/R1;->d(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v2, p1, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    .line 63
    .line 64
    if-eqz v2, :cond_3

    .line 65
    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_3
    invoke-virtual {p1}, Lz1/t1$a;->getIntent()Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v2}, Lx1/O;->g2(Landroid/content/Intent;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_4

    .line 77
    .line 78
    iget-object v2, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 79
    .line 80
    invoke-static {v2, v1}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 81
    .line 82
    .line 83
    :cond_4
    invoke-virtual {p1}, Lz1/t1$a;->getIntent()Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-static {v2}, Lx1/O;->m3(Landroid/content/Intent;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_5

    .line 92
    .line 93
    iget-object v2, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 94
    .line 95
    invoke-static {v2, v1}, Lx1/O;->v5(Landroid/content/Context;Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    invoke-virtual {p1}, Lz1/t1$a;->getIntent()Landroid/content/Intent;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v2}, Lx1/O;->s2(Landroid/content/Intent;)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_6

    .line 107
    .line 108
    iget-object v2, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 109
    .line 110
    invoke-static {v2, v1}, Lx1/O;->r5(Landroid/content/Context;Z)V

    .line 111
    .line 112
    .line 113
    :cond_6
    sget-object v1, Lcom/android/launcher3/resource/B;->l:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    :cond_7
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_a

    .line 124
    .line 125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Ljava/lang/String;

    .line 130
    .line 131
    const-string v3, "com.android.launcher3.prefs.concise"

    .line 132
    .line 133
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_8

    .line 138
    .line 139
    const-string v2, "InstallShortcutReceiver"

    .line 140
    .line 141
    const-string v3, "addToQueue, disable add shortcut in concise mode!"

    .line 142
    .line 143
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_8
    iget-object v3, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-nez v3, :cond_7

    .line 154
    .line 155
    iget-object v3, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 156
    .line 157
    iget-object v4, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 158
    .line 159
    new-instance v5, Lz1/o1;

    .line 160
    .line 161
    invoke-direct {v5, p0}, Lz1/o1;-><init>(Lz1/t1;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v3, v4, v5, v2}, Lcom/android/launcher3/util/R1;->b(Landroid/content/Context;Lcom/android/launcher3/util/R1$a;Ljava/lang/String;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-interface {v3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v4

    .line 172
    if-eqz v4, :cond_9

    .line 173
    .line 174
    if-eqz v0, :cond_7

    .line 175
    .line 176
    :cond_9
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    iget-object v4, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 180
    .line 181
    iget-object v5, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 182
    .line 183
    invoke-virtual {v4, v5, v3, v2}, Lcom/android/launcher3/util/R1;->d(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_a
    :goto_2
    return-void
.end method

.method private j(ILandroid/os/UserHandle;Landroid/content/Intent;)Lz1/t1$a;
    .locals 3

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq p1, v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x6

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const-string p0, "InstallShortcutReceiver"

    .line 12
    .line 13
    const-string p1, "Unknown item type"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_0
    invoke-static {p3, p2}, LN1/e;->c(Landroid/content/Intent;Landroid/os/UserHandle;)LN1/e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, LN1/e;->a(Landroid/content/Context;)LN1/f;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/16 p1, 0xb

    .line 30
    .line 31
    invoke-virtual {p0, p1}, LN1/f;->d(I)LN1/f$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_1
    new-instance p1, Lz1/t1$a;

    .line 43
    .line 44
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Landroid/content/pm/ShortcutInfo;

    .line 49
    .line 50
    invoke-direct {p1, p0, v1}, Lz1/t1$a;-><init>(Landroid/content/pm/ShortcutInfo;Z)V

    .line 51
    .line 52
    .line 53
    return-object p1

    .line 54
    :cond_2
    const-string p1, "appWidgetId"

    .line 55
    .line 56
    invoke-virtual {p3, p1, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iget-object p0, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 61
    .line 62
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-eqz p0, :cond_4

    .line 71
    .line 72
    iget-object v0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 73
    .line 74
    invoke-virtual {p3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {v0, p3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    if-eqz p3, :cond_4

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-virtual {p3, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-nez p2, :cond_3

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    new-instance p2, Lz1/t1$a;

    .line 96
    .line 97
    invoke-direct {p2, p0, p1}, Lz1/t1$a;-><init>(Landroid/appwidget/AppWidgetProviderInfo;I)V

    .line 98
    .line 99
    .line 100
    return-object p2

    .line 101
    :cond_4
    :goto_0
    return-object v2

    .line 102
    :cond_5
    new-instance p0, Lz1/t1$a;

    .line 103
    .line 104
    invoke-virtual {p3}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-direct {p0, p1, p2}, Lz1/t1$a;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 109
    .line 110
    .line 111
    return-object p0
.end method

.method private static k(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 21

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    const-string v2, "intent"

    .line 4
    .line 5
    const-string v3, "title"

    .line 6
    .line 7
    const-string v4, "_id"

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v5, "deleteItemInPendingStallQueue title="

    .line 15
    .line 16
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v5, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v5, "InstallShortcutReceiver"

    .line 29
    .line 30
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->j()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    sget-object v7, Lz1/I0;->m:[Ljava/lang/String;

    .line 42
    .line 43
    array-length v8, v7

    .line 44
    const/4 v9, 0x0

    .line 45
    move v10, v9

    .line 46
    :goto_0
    if-ge v10, v8, :cond_9

    .line 47
    .line 48
    aget-object v12, v7, v10

    .line 49
    .line 50
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_8

    .line 55
    .line 56
    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_8

    .line 61
    .line 62
    :try_start_0
    iget-object v0, v1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 68
    const/4 v14, 0x6

    .line 69
    if-eqz v13, :cond_1

    .line 70
    .line 71
    :try_start_1
    iget v0, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 72
    .line 73
    if-ne v0, v14, :cond_0

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v13

    .line 83
    invoke-static {v0, v13}, LN1/e;->h(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 88
    .line 89
    .line 90
    move-result-object v13

    .line 91
    invoke-virtual {v0, v13}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    goto :goto_2

    .line 96
    :catchall_0
    move-exception v0

    .line 97
    const/4 v11, 0x0

    .line 98
    goto/16 :goto_b

    .line 99
    .line 100
    :catch_0
    move-exception v0

    .line 101
    move/from16 v17, v9

    .line 102
    .line 103
    :goto_1
    const/4 v11, 0x0

    .line 104
    goto/16 :goto_a

    .line 105
    .line 106
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0}, Lcom/android/launcher3/model/data/d;->Q(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    :cond_1
    :goto_2
    const-string v13, ""

    .line 119
    .line 120
    if-eqz v0, :cond_2

    .line 121
    .line 122
    :try_start_2
    invoke-virtual {v0, v9}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v15
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    :goto_3
    move/from16 v17, v9

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_2
    move-object v15, v13

    .line 130
    goto :goto_3

    .line 131
    :goto_4
    :try_start_3
    const-string v9, "itemType"

    .line 132
    .line 133
    filled-new-array {v4, v3, v9, v2}, [Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    iget v11, v1, Lcom/android/launcher3/model/data/y;->itemType:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 138
    .line 139
    move-object/from16 v18, v0

    .line 140
    .line 141
    if-ne v11, v14, :cond_3

    .line 142
    .line 143
    :try_start_4
    const-string v11, "itemType=? and intent LIKE?"

    .line 144
    .line 145
    const/4 v15, 0x2

    .line 146
    new-array v15, v15, [Ljava/lang/String;

    .line 147
    .line 148
    new-instance v14, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const/16 v20, 0x1

    .line 154
    .line 155
    iget v0, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 156
    .line 157
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    aput-object v0, v15, v17

    .line 168
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .line 173
    .line 174
    const-string v14, "%shortcut_id="

    .line 175
    .line 176
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v14

    .line 183
    invoke-static {v14}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v14

    .line 187
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string v14, "%"

    .line 191
    .line 192
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    aput-object v0, v15, v20
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 200
    .line 201
    :goto_5
    move-object v14, v11

    .line 202
    goto :goto_6

    .line 203
    :catch_1
    move-exception v0

    .line 204
    goto :goto_1

    .line 205
    :cond_3
    const/16 v20, 0x1

    .line 206
    .line 207
    :try_start_5
    const-string v11, "itemType=? and intent=?"

    .line 208
    .line 209
    const/4 v0, 0x2

    .line 210
    new-array v0, v0, [Ljava/lang/String;

    .line 211
    .line 212
    new-instance v14, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    move-object/from16 v19, v0

    .line 218
    .line 219
    iget v0, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 220
    .line 221
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    aput-object v0, v19, v17

    .line 232
    .line 233
    aput-object v15, v19, v20

    .line 234
    .line 235
    move-object/from16 v15, v19

    .line 236
    .line 237
    goto :goto_5

    .line 238
    :goto_6
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 247
    .line 248
    .line 249
    move-result-object v11

    .line 250
    const/16 v19, 0x0

    .line 251
    .line 252
    const/16 v16, 0x0

    .line 253
    .line 254
    move-object v0, v13

    .line 255
    move-object v13, v9

    .line 256
    const/4 v9, 0x6

    .line 257
    invoke-virtual/range {v11 .. v16}, Lz1/k2;->Y(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 258
    .line 259
    .line 260
    move-result-object v11
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 261
    if-eqz v11, :cond_7

    .line 262
    .line 263
    :try_start_6
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    .line 264
    .line 265
    .line 266
    move-result v13

    .line 267
    if-lez v13, :cond_7

    .line 268
    .line 269
    iget v13, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 270
    .line 271
    if-ne v13, v9, :cond_6

    .line 272
    .line 273
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    .line 274
    .line 275
    .line 276
    move-result v9

    .line 277
    move/from16 v13, v20

    .line 278
    .line 279
    if-ne v9, v13, :cond_6

    .line 280
    .line 281
    invoke-static {v12}, Lcom/android/launcher3/resource/B;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v9

    .line 285
    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v13

    .line 289
    if-eqz v13, :cond_4

    .line 290
    .line 291
    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v13

    .line 295
    goto :goto_7

    .line 296
    :catchall_1
    move-exception v0

    .line 297
    goto/16 :goto_b

    .line 298
    .line 299
    :catch_2
    move-exception v0

    .line 300
    goto/16 :goto_a

    .line 301
    .line 302
    :cond_4
    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 303
    .line 304
    .line 305
    move-result-object v13

    .line 306
    if-eqz v13, :cond_5

    .line 307
    .line 308
    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v13

    .line 316
    goto :goto_7

    .line 317
    :cond_5
    move-object v13, v0

    .line 318
    :goto_7
    new-instance v0, LN1/e;

    .line 319
    .line 320
    iget-object v14, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 321
    .line 322
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v15

    .line 326
    invoke-direct {v0, v13, v14, v15}, LN1/e;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 330
    .line 331
    .line 332
    move-result-object v13

    .line 333
    invoke-virtual {v13, v9, v0}, Lcom/android/launcher3/H5;->p(Ljava/lang/String;LN1/e;)V

    .line 334
    .line 335
    .line 336
    :cond_6
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 337
    .line 338
    .line 339
    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    invoke-interface {v11, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 348
    .line 349
    .line 350
    move-result v9

    .line 351
    invoke-interface {v11, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    invoke-interface {v11, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 355
    .line 356
    .line 357
    move-result v9

    .line 358
    invoke-interface {v11, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v9

    .line 362
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 363
    .line 364
    .line 365
    move-result-object v13

    .line 366
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 367
    .line 368
    .line 369
    move-result-object v13

    .line 370
    invoke-virtual {v13}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 371
    .line 372
    .line 373
    move-result-object v13

    .line 374
    new-instance v14, Ljava/lang/StringBuilder;

    .line 375
    .line 376
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 377
    .line 378
    .line 379
    const-string v15, "_id="

    .line 380
    .line 381
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v14

    .line 391
    const/4 v15, 0x0

    .line 392
    invoke-virtual {v13, v12, v14, v15}, Lz1/k2;->l(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 393
    .line 394
    .line 395
    move-result v13

    .line 396
    new-instance v14, Ljava/lang/StringBuilder;

    .line 397
    .line 398
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 399
    .line 400
    .line 401
    const-string v15, "deleteItemInAllDbs tableName="

    .line 402
    .line 403
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    .line 405
    .line 406
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    const-string v15, " title="

    .line 410
    .line 411
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    const-string v9, " id="

    .line 418
    .line 419
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    const-string v0, " result="

    .line 426
    .line 427
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 438
    .line 439
    .line 440
    :cond_7
    :goto_8
    invoke-static {v11}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 441
    .line 442
    .line 443
    goto :goto_c

    .line 444
    :catchall_2
    move-exception v0

    .line 445
    const/4 v15, 0x0

    .line 446
    move-object v11, v15

    .line 447
    goto :goto_b

    .line 448
    :catch_3
    move-exception v0

    .line 449
    :goto_9
    const/4 v15, 0x0

    .line 450
    move-object v11, v15

    .line 451
    goto :goto_a

    .line 452
    :catch_4
    move-exception v0

    .line 453
    move/from16 v17, v9

    .line 454
    .line 455
    goto :goto_9

    .line 456
    :goto_a
    :try_start_7
    new-instance v9, Ljava/lang/StringBuilder;

    .line 457
    .line 458
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 459
    .line 460
    .line 461
    const-string v13, "deleteItemInAllDbs error, tableName="

    .line 462
    .line 463
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v9

    .line 473
    invoke-static {v5, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 474
    .line 475
    .line 476
    goto :goto_8

    .line 477
    :goto_b
    invoke-static {v11}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 478
    .line 479
    .line 480
    throw v0

    .line 481
    :cond_8
    move/from16 v17, v9

    .line 482
    .line 483
    :goto_c
    add-int/lit8 v10, v10, 0x1

    .line 484
    .line 485
    move/from16 v9, v17

    .line 486
    .line 487
    goto/16 :goto_0

    .line 488
    .line 489
    :cond_9
    return-void
.end method

.method private l(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 8

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "deleteItemInPendingStallQueue title="

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "InstallShortcutReceiver"

    .line 21
    .line 22
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->k()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget-object v1, Lcom/android/launcher3/resource/B;->l:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_3

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_0

    .line 56
    .line 57
    iget-object v3, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 58
    .line 59
    iget-object v4, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 60
    .line 61
    new-instance v5, Lz1/o1;

    .line 62
    .line 63
    invoke-direct {v5, p0}, Lz1/o1;-><init>(Lz1/t1;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v4, v5, v2}, Lcom/android/launcher3/util/R1;->b(Landroid/content/Context;Lcom/android/launcher3/util/R1$a;Ljava/lang/String;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v5, :cond_2

    .line 79
    .line 80
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    check-cast v5, Lz1/t1$a;

    .line 85
    .line 86
    if-eqz v5, :cond_1

    .line 87
    .line 88
    iget-object v6, v5, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 89
    .line 90
    if-eqz v6, :cond_1

    .line 91
    .line 92
    iget-object v7, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 93
    .line 94
    invoke-virtual {v6, v7}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-eqz v6, :cond_1

    .line 99
    .line 100
    iget v6, v5, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 101
    .line 102
    iget v7, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 103
    .line 104
    if-ne v6, v7, :cond_1

    .line 105
    .line 106
    iget-object v6, v5, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 107
    .line 108
    iget-object v7, p2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 109
    .line 110
    invoke-static {v6, v7}, Lz1/t1;->s(Landroid/content/Intent;Landroid/content/Intent;)Z

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    if-eqz v6, :cond_1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_2
    const/4 v5, 0x0

    .line 118
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v6, "deleteItemInPendingStallQueue pref="

    .line 124
    .line 125
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v6, " title="

    .line 132
    .line 133
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object v6, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 137
    .line 138
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    invoke-interface {v3, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    iget-object v4, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 152
    .line 153
    iget-object v5, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 154
    .line 155
    invoke-virtual {v4, v5, v3, v2}, Lcom/android/launcher3/util/R1;->d(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_0

    .line 163
    .line 164
    iget-object v3, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 165
    .line 166
    iget-object v4, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 167
    .line 168
    invoke-virtual {v3, v4, v2}, Lcom/android/launcher3/util/R1;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/util/AtomicFile;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v2}, Landroid/util/AtomicFile;->delete()V

    .line 173
    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_3
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->k()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lz1/t1;->d:Ljava/util/List;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void

    .line 28
    :cond_1
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v2, "ItemInstallQueue ensureQueueLoaded mItems="

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lz1/t1;->d:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, " mItemsPrefsName="

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v2, " prefsName="

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "InstallShortcutReceiver"

    .line 66
    .line 67
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 73
    .line 74
    iget-object v2, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 75
    .line 76
    new-instance v3, Lz1/o1;

    .line 77
    .line 78
    invoke-direct {v3, p0}, Lz1/o1;-><init>(Lz1/t1;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v2, v3, v0}, Lcom/android/launcher3/util/R1;->b(Landroid/content/Context;Lcom/android/launcher3/util/R1$a;Ljava/lang/String;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lz1/t1;->d:Ljava/util/List;

    .line 86
    .line 87
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget v0, p0, Lz1/t1;->c:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v1, Lz1/k1;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lz1/k1;-><init>(Lz1/t1;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private o()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/H;->getCreatedContext()Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "InstallShortcutReceiver"

    .line 13
    .line 14
    const-string v2, "flushQueueInBackground and call InstallShortcutReceiver.flushInstallQueue"

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/android/launcher3/InstallShortcutReceiver;->m(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lz1/t1;->m()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lz1/t1;->d:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_1
    iget-object v1, p0, Lz1/t1;->d:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Lz1/n1;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Lz1/n1;-><init>(Lz1/t1;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object v0, p0, Lz1/t1;->d:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 80
    .line 81
    iget-object v1, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 82
    .line 83
    iget-object p0, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/R1;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/util/AtomicFile;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Landroid/util/AtomicFile;->delete()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private static p(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static s(Landroid/content/Intent;Landroid/content/Intent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v1, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v1, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p0, p1}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    return v0
.end method

.method private synthetic t(Lz1/t1$a;)Landroid/util/Pair;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lz1/t1$a;->w(Landroid/content/Context;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic u(Lz1/t1$a;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lz1/t1$a;->w(Landroid/content/Context;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ItemInstallQueue"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "Adding PendingInstallShortcutInfo with no attached info to queue."

    .line 12
    .line 13
    invoke-static {v1, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v3, "Adding PendingInstallShortcutInfo to queue. Attached info: "

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v1, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-direct {p0, p1}, Lz1/t1;->i(Lz1/t1$a;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static v(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->isShortcutAddFromOtherApp()Z

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
    const-string v1, "onWorkspaceItemRemoved isShortcutAddFromOtherApp title="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "InstallShortcutReceiver"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lx1/O;->g2(Landroid/content/Intent;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v1, 0x0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {p0, v1}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Lx1/O;->m3(Landroid/content/Intent;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-static {p0, v1}, Lx1/O;->v5(Landroid/content/Context;Z)V

    .line 59
    .line 60
    .line 61
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Lx1/O;->s2(Landroid/content/Intent;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    invoke-static {p0, v1}, Lx1/O;->r5(Landroid/content/Context;Z)V

    .line 72
    .line 73
    .line 74
    :cond_3
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 75
    .line 76
    new-instance v1, Lz1/m1;

    .line 77
    .line 78
    invoke-direct {v1, p0, p1}, Lz1/m1;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public B(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .locals 2
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
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0}, Lz1/t1;->m()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lz1/t1;->d:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Lz1/p1;

    .line 14
    .line 15
    invoke-direct {v1, p2, p1}, Lz1/p1;-><init>(Landroid/os/UserHandle;Ljava/util/HashSet;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lz1/t1;->a:Lcom/android/launcher3/util/R1;

    .line 25
    .line 26
    iget-object p2, p0, Lz1/t1;->b:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v0, p0, Lz1/t1;->d:Ljava/util/List;

    .line 29
    .line 30
    iget-object p0, p0, Lz1/t1;->e:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, p2, v0, p0}, Lcom/android/launcher3/util/R1;->d(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public C(I)V
    .locals 1

    .line 1
    iget v0, p0, Lz1/t1;->c:I

    .line 2
    .line 3
    not-int p1, p1

    .line 4
    and-int/2addr p1, v0

    .line 5
    iput p1, p0, Lz1/t1;->c:I

    .line 6
    .line 7
    invoke-direct {p0}, Lz1/t1;->n()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Landroid/os/UserHandle;)Ljava/util/stream/Stream;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/stream/Stream<",
            "LN1/e;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lz1/t1;->m()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lz1/t1;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Lz1/q1;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lz1/q1;-><init>(Landroid/os/UserHandle;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Lz1/r1;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Lz1/r1;-><init>(Landroid/os/UserHandle;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget p0, p0, Lz1/t1;->c:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public w(I)V
    .locals 1

    .line 1
    iget v0, p0, Lz1/t1;->c:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lz1/t1;->c:I

    .line 5
    .line 6
    return-void
.end method

.method public x(Landroid/appwidget/AppWidgetProviderInfo;I)V
    .locals 1

    .line 1
    new-instance v0, Lz1/t1$a;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lz1/t1$a;-><init>(Landroid/appwidget/AppWidgetProviderInfo;I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lz1/t1;->A(Lz1/t1$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y(Landroid/content/pm/ShortcutInfo;Z)V
    .locals 1

    .line 1
    new-instance v0, Lz1/t1$a;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lz1/t1$a;-><init>(Landroid/content/pm/ShortcutInfo;Z)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lz1/t1;->A(Lz1/t1$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/t1$a;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lz1/t1$a;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lz1/t1;->A(Lz1/t1$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
