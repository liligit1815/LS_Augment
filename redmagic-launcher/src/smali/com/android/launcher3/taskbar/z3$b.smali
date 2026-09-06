.class Lcom/android/launcher3/taskbar/z3$b;
.super LO1/a;
.source "TaskbarPopupController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/z3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LO1/a<",
        "Lcom/android/launcher3/taskbar/b;",
        ">;"
    }
.end annotation


# instance fields
.field private final i:Z


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/util/y2$b;Z)V
    .locals 7

    .line 1
    iget v1, p4, Lcom/android/launcher3/util/y2$b;->a:I

    .line 2
    .line 3
    iget v2, p4, Lcom/android/launcher3/util/y2$b;->b:I

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v4, p2

    .line 8
    move-object v5, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-direct/range {v0 .. v6}, LO1/a;-><init>(IILandroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/util/y2$b;)V

    .line 11
    .line 12
    .line 13
    iput-boolean p5, v0, Lcom/android/launcher3/taskbar/z3$b;->i:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->j()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/z3$b;->i:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-super {p0, p1}, LO1/a;->onClick(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/LogUtils;->getShellShareableInstanceId()Landroid/util/Pair;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 26
    .line 27
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 28
    .line 29
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v1, Lcom/android/launcher3/logging/d;

    .line 46
    .line 47
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0}, LO1/a;->J()Lcom/android/launcher3/util/y2$b;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget v1, v1, Lcom/android/launcher3/util/y2$b;->c:I

    .line 56
    .line 57
    invoke-static {v1}, Lcom/android/launcher3/util/y2;->a(I)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 65
    .line 66
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 67
    .line 68
    const/4 v2, 0x6

    .line 69
    if-ne v1, v2, :cond_1

    .line 70
    .line 71
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 72
    .line 73
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 76
    .line 77
    check-cast v2, Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    move-object v2, v1

    .line 84
    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {p0}, LO1/a;->J()Lcom/android/launcher3/util/y2$b;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iget v5, p0, Lcom/android/launcher3/util/y2$b;->c:I

    .line 103
    .line 104
    iget-object v7, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 105
    .line 106
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 107
    .line 108
    move-object v8, p0

    .line 109
    check-cast v8, Lcom/android/internal/logging/InstanceId;

    .line 110
    .line 111
    const/4 v6, 0x0

    .line 112
    invoke-virtual/range {v2 .. v8}, Lcom/android/quickstep/SystemUiProxy;->startShortcut(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Bundle;Landroid/os/UserHandle;Lcom/android/internal/logging/InstanceId;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 119
    .line 120
    check-cast v1, Landroid/content/Context;

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    move-object v1, v0

    .line 127
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 130
    .line 131
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 132
    .line 133
    const-class v2, Landroid/content/pm/LauncherApps;

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 140
    .line 141
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 142
    .line 143
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 152
    .line 153
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 154
    .line 155
    const/4 v4, 0x0

    .line 156
    invoke-virtual {v0, v2, v4, v3}, Landroid/content/pm/LauncherApps;->getMainActivityLaunchIntent(Landroid/content/ComponentName;Landroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 161
    .line 162
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    new-instance v4, Landroid/content/Intent;

    .line 169
    .line 170
    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, LO1/a;->J()Lcom/android/launcher3/util/y2$b;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    iget v5, p0, Lcom/android/launcher3/util/y2$b;->c:I

    .line 178
    .line 179
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 180
    .line 181
    move-object v7, p0

    .line 182
    check-cast v7, Lcom/android/internal/logging/InstanceId;

    .line 183
    .line 184
    const/4 v6, 0x0

    .line 185
    invoke-virtual/range {v1 .. v7}, Lcom/android/quickstep/SystemUiProxy;->startIntent(Landroid/app/PendingIntent;ILandroid/content/Intent;ILandroid/os/Bundle;Lcom/android/internal/logging/InstanceId;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method
