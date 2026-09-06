.class public Lcom/android/launcher3/taskbar/K3;
.super LO0/c;
.source "TaskbarShortcutMenuAccessibilityDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LO0/c<",
        "Lcom/android/launcher3/taskbar/I1;",
        ">;"
    }
.end annotation


# instance fields
.field private final j:Landroid/content/pm/LauncherApps;

.field private final k:Lcom/android/launcher3/logging/StatsLogManager;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, LO0/c;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/taskbar/K3;->j:Landroid/content/pm/LauncherApps;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/taskbar/K3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 19
    .line 20
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 21
    .line 22
    new-instance v0, LO0/c$c;

    .line 23
    .line 24
    const v1, 0x7f140039

    .line 25
    .line 26
    .line 27
    const/16 v2, 0x2f

    .line 28
    .line 29
    const v3, 0x7f0b004a

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, p0, v3, v1, v2}, LO0/c$c;-><init>(LO0/c;III)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 39
    .line 40
    new-instance v0, LO0/c$c;

    .line 41
    .line 42
    const v1, 0x7f0b005c

    .line 43
    .line 44
    .line 45
    const v2, 0x7f140277

    .line 46
    .line 47
    .line 48
    const/16 v3, 0x28

    .line 49
    .line 50
    invoke-direct {v0, p0, v1, v2, v3}, LO0/c$c;-><init>(LO0/c;III)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 57
    .line 58
    new-instance v0, LO0/c$c;

    .line 59
    .line 60
    const v1, 0x7f140276

    .line 61
    .line 62
    .line 63
    const/16 v2, 0x2e

    .line 64
    .line 65
    const v4, 0x7f0b005b

    .line 66
    .line 67
    .line 68
    invoke-direct {v0, p0, v4, v1, v2}, LO0/c$c;-><init>(LO0/c;III)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v4, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 75
    .line 76
    new-instance v0, LO0/c$c;

    .line 77
    .line 78
    const v1, 0x7f1402d5

    .line 79
    .line 80
    .line 81
    const v2, 0x7f0b0049

    .line 82
    .line 83
    .line 84
    invoke-direct {v0, p0, v2, v1, v3}, LO0/c$c;-><init>(LO0/c;III)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method


# virtual methods
.method protected d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "LO0/c<",
            "Lcom/android/launcher3/taskbar/I1;",
            ">.c;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 8
    .line 9
    const p2, 0x7f0b004a

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, LO0/c$c;

    .line 17
    .line 18
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 22
    .line 23
    const p2, 0x7f0b005c

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, LO0/c$c;

    .line 31
    .line 32
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 36
    .line 37
    const p2, 0x7f0b005b

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, LO0/c$c;

    .line 45
    .line 46
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-static {}, LN2/g;->c()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-object p0, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 56
    .line 57
    const p1, 0x7f0b0049

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, LO0/c$c;

    .line 65
    .line 66
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method protected i(Landroid/view/View;Lcom/android/launcher3/model/data/y;IZ)Z
    .locals 10

    .line 1
    const p4, 0x7f0b004a

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-ne p3, p4, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, LO0/c;->h:Landroid/content/Context;

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->s2(Lcom/android/launcher3/BubbleTextView;)V

    .line 14
    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    const p1, 0x7f0b0049

    .line 18
    .line 19
    .line 20
    const/4 p4, 0x0

    .line 21
    const/4 v1, 0x6

    .line 22
    if-ne p3, p1, :cond_2

    .line 23
    .line 24
    iget p1, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 25
    .line 26
    if-ne p1, v1, :cond_1

    .line 27
    .line 28
    instance-of p1, p2, Lcom/android/launcher3/model/data/I;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->R()Landroid/content/pm/ShortcutInfo;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object p2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 39
    .line 40
    iget-object p0, p0, LO0/c;->h:Landroid/content/Context;

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->showShortcutBubble(Landroid/content/pm/ShortcutInfo;)V

    .line 49
    .line 50
    .line 51
    return v0

    .line 52
    :cond_1
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-eqz p1, :cond_6

    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    if-eqz p1, :cond_6

    .line 67
    .line 68
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 69
    .line 70
    iget-object p0, p0, LO0/c;->h:Landroid/content/Context;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 83
    .line 84
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->showAppBubble(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 85
    .line 86
    .line 87
    return v0

    .line 88
    :cond_2
    instance-of p1, p2, Lcom/android/launcher3/model/data/z;

    .line 89
    .line 90
    if-eqz p1, :cond_6

    .line 91
    .line 92
    const p1, 0x7f0b005c

    .line 93
    .line 94
    .line 95
    if-eq p3, p1, :cond_3

    .line 96
    .line 97
    const v2, 0x7f0b005b

    .line 98
    .line 99
    .line 100
    if-ne p3, v2, :cond_6

    .line 101
    .line 102
    :cond_3
    move-object v2, p2

    .line 103
    check-cast v2, Lcom/android/launcher3/model/data/z;

    .line 104
    .line 105
    if-ne p3, p1, :cond_4

    .line 106
    .line 107
    move v6, p4

    .line 108
    goto :goto_0

    .line 109
    :cond_4
    move v6, v0

    .line 110
    :goto_0
    invoke-static {}, Lcom/android/quickstep/util/LogUtils;->getShellShareableInstanceId()Landroid/util/Pair;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget-object p3, p0, Lcom/android/launcher3/taskbar/K3;->k:Lcom/android/launcher3/logging/StatsLogManager;

    .line 115
    .line 116
    invoke-virtual {p3}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-interface {p3, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    iget-object p4, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast p4, Lcom/android/launcher3/logging/d;

    .line 127
    .line 128
    invoke-interface {p3, p4}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 129
    .line 130
    .line 131
    move-result-object p3

    .line 132
    invoke-static {v6}, Lcom/android/launcher3/util/y2;->a(I)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 133
    .line 134
    .line 135
    move-result-object p4

    .line 136
    invoke-interface {p3, p4}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 137
    .line 138
    .line 139
    iget p3, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 140
    .line 141
    if-ne p3, v1, :cond_5

    .line 142
    .line 143
    instance-of p3, p2, Lcom/android/launcher3/model/data/I;

    .line 144
    .line 145
    if-eqz p3, :cond_5

    .line 146
    .line 147
    sget-object p2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 148
    .line 149
    iget-object p0, p0, LO0/c;->h:Landroid/content/Context;

    .line 150
    .line 151
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    move-object v3, p0

    .line 156
    check-cast v3, Lcom/android/quickstep/SystemUiProxy;

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    move-object p0, v2

    .line 167
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    iget-object v8, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 174
    .line 175
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 176
    .line 177
    move-object v9, p0

    .line 178
    check-cast v9, Lcom/android/internal/logging/InstanceId;

    .line 179
    .line 180
    const/4 v7, 0x0

    .line 181
    invoke-virtual/range {v3 .. v9}, Lcom/android/quickstep/SystemUiProxy;->startShortcut(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Bundle;Landroid/os/UserHandle;Lcom/android/internal/logging/InstanceId;)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_5
    sget-object p3, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 186
    .line 187
    iget-object p4, p0, LO0/c;->h:Landroid/content/Context;

    .line 188
    .line 189
    invoke-virtual {p3, p4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    move-object v3, p3

    .line 194
    check-cast v3, Lcom/android/quickstep/SystemUiProxy;

    .line 195
    .line 196
    iget-object p0, p0, Lcom/android/launcher3/taskbar/K3;->j:Landroid/content/pm/LauncherApps;

    .line 197
    .line 198
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 199
    .line 200
    .line 201
    move-result-object p3

    .line 202
    invoke-virtual {p3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 203
    .line 204
    .line 205
    move-result-object p3

    .line 206
    const/4 p4, 0x0

    .line 207
    iget-object v1, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 208
    .line 209
    invoke-virtual {p0, p3, p4, v1}, Landroid/content/pm/LauncherApps;->getMainActivityLaunchIntent(Landroid/content/ComponentName;Landroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    iget-object p0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 214
    .line 215
    invoke-virtual {p0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    move v7, v6

    .line 220
    new-instance v6, Landroid/content/Intent;

    .line 221
    .line 222
    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 223
    .line 224
    .line 225
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 226
    .line 227
    move-object v9, p0

    .line 228
    check-cast v9, Lcom/android/internal/logging/InstanceId;

    .line 229
    .line 230
    const/4 v8, 0x0

    .line 231
    invoke-virtual/range {v3 .. v9}, Lcom/android/quickstep/SystemUiProxy;->startIntent(Landroid/app/PendingIntent;ILandroid/content/Intent;ILandroid/os/Bundle;Lcom/android/internal/logging/InstanceId;)V

    .line 232
    .line 233
    .line 234
    :goto_1
    return v0

    .line 235
    :cond_6
    return p4
.end method
