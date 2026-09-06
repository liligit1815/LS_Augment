.class Lz1/t1$a;
.super Lcom/android/launcher3/model/data/y;
.source "ItemInstallQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/t1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field final g:Landroid/content/Intent;

.field h:Landroid/content/pm/ShortcutInfo;

.field i:Landroid/appwidget/AppWidgetProviderInfo;

.field j:Z


# direct methods
.method public constructor <init>(Landroid/appwidget/AppWidgetProviderInfo;I)V
    .locals 2

    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lz1/t1$a;->j:Z

    const/4 v0, 0x4

    .line 15
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 16
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iget-object v1, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appWidgetId"

    .line 18
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2

    iput-object p2, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 19
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 20
    iput-object p1, p0, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ShortcutInfo;Z)V
    .locals 1

    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lz1/t1$a;->j:Z

    const/4 v0, 0x6

    .line 8
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 9
    invoke-static {p1}, LN1/e;->g(Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 10
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 11
    iput-object p1, p0, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 12
    iput-boolean p2, p0, Lz1/t1$a;->j:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lz1/t1$a;->j:Z

    .line 3
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 5
    iput-object p2, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    return-void
.end method

.method public static synthetic v(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/pm/LauncherActivityInfo;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    instance-of v0, p1, Lz1/t1$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    check-cast p1, Lz1/t1$a;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 9
    .line 10
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v2, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 17
    .line 18
    iget v3, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    if-ne v2, v3, :cond_0

    .line 22
    .line 23
    move v2, v4

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v2, v1

    .line 26
    :goto_0
    iget-object v3, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 27
    .line 28
    invoke-virtual {v3, v1}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iget-object v5, p1, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 33
    .line 34
    invoke-virtual {v5, v1}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object v5, p0, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 43
    .line 44
    if-nez v5, :cond_2

    .line 45
    .line 46
    iget-object v5, p1, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 47
    .line 48
    if-nez v5, :cond_1

    .line 49
    .line 50
    :goto_1
    move v5, v4

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    move v5, v1

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    iget-object v6, p1, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 55
    .line 56
    if-eqz v6, :cond_1

    .line 57
    .line 58
    invoke-virtual {v5}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v6, p1, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 63
    .line 64
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    iget-object v5, p0, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 75
    .line 76
    invoke-virtual {v5}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    iget-object v6, p1, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 81
    .line 82
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-eqz v5, :cond_1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :goto_2
    iget-object p0, p0, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    .line 94
    .line 95
    if-nez p0, :cond_4

    .line 96
    .line 97
    iget-object p0, p1, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    .line 98
    .line 99
    if-nez p0, :cond_3

    .line 100
    .line 101
    :goto_3
    move p0, v4

    .line 102
    goto :goto_4

    .line 103
    :cond_3
    move p0, v1

    .line 104
    goto :goto_4

    .line 105
    :cond_4
    iget-object p1, p1, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    .line 106
    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 110
    .line 111
    iget-object p1, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_3

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :goto_4
    if-eqz v0, :cond_5

    .line 121
    .line 122
    if-eqz v2, :cond_5

    .line 123
    .line 124
    if-eqz v3, :cond_5

    .line 125
    .line 126
    if-eqz v5, :cond_5

    .line 127
    .line 128
    if-eqz p0, :cond_5

    .line 129
    .line 130
    return v4

    .line 131
    :cond_5
    return v1
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Landroid/content/Context;)Landroid/util/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v3, 0x4

    .line 8
    if-eq v0, v3, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x6

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_0
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 15
    .line 16
    iget-object v1, p0, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 17
    .line 18
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/y;->setShortcutAddFromOtherApp(Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v1, p0, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lz1/t1$a;->h:Landroid/content/pm/ShortcutInfo;

    .line 39
    .line 40
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_1
    iget-object v0, p0, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    .line 46
    .line 47
    invoke-static {p1, v0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v2, Lcom/android/launcher3/model/data/A;

    .line 52
    .line 53
    iget-object v3, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 54
    .line 55
    const-string v4, "appWidgetId"

    .line 56
    .line 57
    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iget-object v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 62
    .line 63
    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget v1, v0, Lcom/android/launcher3/widget/U;->i:I

    .line 71
    .line 72
    iput v1, v2, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 73
    .line 74
    iget v1, v0, Lcom/android/launcher3/widget/U;->j:I

    .line 75
    .line 76
    iput v1, v2, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 77
    .line 78
    iget v1, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 79
    .line 80
    iget v3, p1, Lcom/android/launcher3/F1;->H0:I

    .line 81
    .line 82
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iput v1, v2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 87
    .line 88
    iget v0, v0, Lcom/android/launcher3/widget/U;->h:I

    .line 89
    .line 90
    iget p1, p1, Lcom/android/launcher3/F1;->G0:I

    .line 91
    .line 92
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    iput p1, v2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 97
    .line 98
    iget-object p1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 99
    .line 100
    iput-object p1, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 101
    .line 102
    iget-object p0, p0, Lz1/t1$a;->i:Landroid/appwidget/AppWidgetProviderInfo;

    .line 103
    .line 104
    invoke-static {v2, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_2
    iget-object v0, p0, Lz1/t1$a;->g:Landroid/content/Intent;

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 116
    .line 117
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    check-cast v3, Landroid/content/pm/LauncherApps;

    .line 122
    .line 123
    iget-object v4, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 124
    .line 125
    invoke-virtual {v3, v0, v4}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    new-instance v4, Lcom/android/launcher3/model/data/I;

    .line 130
    .line 131
    invoke-direct {v4}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 135
    .line 136
    iput-object p0, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 137
    .line 138
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-eqz p0, :cond_3

    .line 143
    .line 144
    new-instance v1, Landroid/content/ComponentName;

    .line 145
    .line 146
    const-string v3, ""

    .line 147
    .line 148
    invoke-direct {v1, v0, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1}, Lcom/android/launcher3/model/data/d;->Q(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, v4, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 160
    .line 161
    iget v0, v4, Lcom/android/launcher3/model/data/I;->m:I

    .line 162
    .line 163
    or-int/lit8 v0, v0, 0x2

    .line 164
    .line 165
    iput v0, v4, Lcom/android/launcher3/model/data/I;->m:I

    .line 166
    .line 167
    move-object v0, v2

    .line 168
    goto :goto_0

    .line 169
    :cond_3
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    check-cast v0, Landroid/content/pm/LauncherActivityInfo;

    .line 174
    .line 175
    invoke-static {v0}, Lcom/android/launcher3/model/data/d;->R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    iput-object v1, v4, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 180
    .line 181
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_4

    .line 186
    .line 187
    invoke-virtual {v0}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    iget-boolean v1, v1, Landroid/content/pm/ActivityInfo;->isArchived:Z

    .line 192
    .line 193
    if-eqz v1, :cond_4

    .line 194
    .line 195
    iget v1, v4, Lcom/android/launcher3/model/data/z;->h:I

    .line 196
    .line 197
    or-int/lit16 v1, v1, 0x4000

    .line 198
    .line 199
    iput v1, v4, Lcom/android/launcher3/model/data/z;->h:I

    .line 200
    .line 201
    :cond_4
    :goto_0
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    new-instance v1, Lz1/s1;

    .line 210
    .line 211
    invoke-direct {v1, v0}, Lz1/s1;-><init>(Landroid/content/pm/LauncherActivityInfo;)V

    .line 212
    .line 213
    .line 214
    sget-object v0, Lcom/android/launcher3/S3;->b:Lt1/g;

    .line 215
    .line 216
    invoke-virtual {v0, p0}, Lt1/g;->n(Z)Lt1/g;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-virtual {p1, v4, v1, p0}, Ls1/P;->G0(Lcom/android/launcher3/model/data/z;Ljava/util/function/Supplier;Lt1/g;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v4, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    return-object p0
.end method
