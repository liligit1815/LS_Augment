.class Lcom/android/launcher3/InstallShortcutReceiver$b;
.super Ljava/lang/Object;
.source "InstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/InstallShortcutReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field final a:Z

.field final b:Landroid/content/pm/ShortcutInfo;

.field final c:Landroid/appwidget/AppWidgetProviderInfo;

.field final d:Landroid/content/Intent;

.field final e:Landroid/content/Context;

.field final f:Landroid/content/Intent;

.field final g:Ljava/lang/String;

.field final h:Landroid/os/UserHandle;


# direct methods
.method public constructor <init>(Landroid/appwidget/AppWidgetProviderInfo;ILandroid/content/Context;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 49
    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 50
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 51
    iput-object p3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 52
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 53
    new-instance p3, Landroid/content/Intent;

    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {p3, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p3

    const-string v0, "appWidgetId"

    .line 54
    invoke-virtual {p3, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 55
    iget-object p1, p1, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Landroid/content/Context;Landroid/os/UserHandle;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 31
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 32
    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 33
    iput-object p3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 34
    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 35
    const-string p2, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/content/Intent;

    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 36
    const-string p2, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Landroid/os/UserHandle;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 4
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 6
    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 7
    iput-object p3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 8
    const-string p2, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/content/Intent;

    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 9
    const-string p2, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/LauncherActivityInfo;Landroid/content/Context;)V
    .locals 5

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 14
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 15
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 16
    const-string v2, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getLabel()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 17
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 18
    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 19
    invoke-static {p1}, Lcom/android/launcher3/model/data/d;->R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 20
    const-string v2, "cn.nubia.gamelauncher"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "android.intent.extra.shortcut.INTENT"

    if-nez v2, :cond_1

    const-string v2, "cn.nubia.redmagickyi"

    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "cn.nubia.inspiredwallpaper"

    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/content/ComponentName;

    const-string v4, ""

    invoke-direct {v2, v0, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p2

    .line 24
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    .line 25
    invoke-virtual {v1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    invoke-virtual {v1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 27
    :goto_1
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getLabel()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    .line 39
    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 41
    iput-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 42
    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 43
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 44
    invoke-static {p1}, LN1/e;->g(Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 45
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    const-string v3, "userHandle"

    .line 6
    .line 7
    const-string v4, "intent.launch"

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    new-instance v1, Lorg/json/JSONStringer;

    .line 13
    .line 14
    invoke-direct {v1}, Lorg/json/JSONStringer;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, v4}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 26
    .line 27
    invoke-virtual {v4, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v1, v4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v4, "isDeepShortcut"

    .line 36
    .line 37
    invoke-virtual {v1, v4}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, v2}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "isQuickApp"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 52
    .line 53
    const-string v4, "isCustomApp"

    .line 54
    .line 55
    invoke-static {v2, v4}, Lcom/android/launcher3/H5;->j0(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {v1, v2}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget-object v2, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 68
    .line 69
    iget-object v3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, LD1/t;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 78
    .line 79
    invoke-virtual {v2, p0}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :catch_0
    move-exception p0

    .line 97
    goto/16 :goto_3

    .line 98
    .line 99
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 100
    .line 101
    if-eqz v1, :cond_1

    .line 102
    .line 103
    new-instance v1, Lorg/json/JSONStringer;

    .line 104
    .line 105
    invoke-direct {v1}, Lorg/json/JSONStringer;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1, v4}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 117
    .line 118
    invoke-virtual {v4, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-virtual {v1, v4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v4, "isAppWidget"

    .line 127
    .line 128
    invoke-virtual {v1, v4}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v1, v2}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    sget-object v2, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 141
    .line 142
    iget-object v3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 143
    .line 144
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, LD1/t;

    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 151
    .line 152
    invoke-virtual {v2, p0}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 153
    .line 154
    .line 155
    move-result-wide v2

    .line 156
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0

    .line 169
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 170
    .line 171
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    if-nez v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 178
    .line 179
    const-string v2, "android.intent.action.VIEW"

    .line 180
    .line 181
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 186
    .line 187
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "android.intent.action.MAIN"

    .line 192
    .line 193
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_3

    .line 198
    .line 199
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 200
    .line 201
    invoke-virtual {v1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    if-eqz v1, :cond_3

    .line 206
    .line 207
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 208
    .line 209
    invoke-virtual {v1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    const-string v2, "android.intent.category.LAUNCHER"

    .line 214
    .line 215
    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_3

    .line 220
    .line 221
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 222
    .line 223
    const/high16 v2, 0x10200000

    .line 224
    .line 225
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 226
    .line 227
    .line 228
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 229
    .line 230
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 231
    .line 232
    iget-object v6, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    .line 233
    .line 234
    invoke-static {v1, v2, v6}, Lcom/android/launcher3/InstallShortcutReceiver;->l(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 243
    .line 244
    if-nez v2, :cond_4

    .line 245
    .line 246
    move-object v2, v0

    .line 247
    goto :goto_1

    .line 248
    :cond_4
    const-string v6, "android.intent.extra.shortcut.ICON"

    .line 249
    .line 250
    invoke-virtual {v2, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    check-cast v2, Landroid/graphics/Bitmap;

    .line 255
    .line 256
    :goto_1
    iget-object v6, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 257
    .line 258
    if-nez v6, :cond_5

    .line 259
    .line 260
    move-object v6, v0

    .line 261
    goto :goto_2

    .line 262
    :cond_5
    const-string v7, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 263
    .line 264
    invoke-virtual {v6, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 265
    .line 266
    .line 267
    move-result-object v6

    .line 268
    check-cast v6, Landroid/content/Intent$ShortcutIconResource;

    .line 269
    .line 270
    :goto_2
    new-instance v7, Lorg/json/JSONStringer;

    .line 271
    .line 272
    invoke-direct {v7}, Lorg/json/JSONStringer;-><init>()V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v7}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    invoke-virtual {v7, v4}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    iget-object v7, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 284
    .line 285
    invoke-virtual {v7, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v7

    .line 289
    invoke-virtual {v4, v7}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    const-string v7, "name"

    .line 294
    .line 295
    invoke-virtual {v4, v7}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    invoke-virtual {v4, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    invoke-virtual {v1, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    sget-object v3, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 308
    .line 309
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 310
    .line 311
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    check-cast v3, LD1/t;

    .line 316
    .line 317
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 318
    .line 319
    invoke-virtual {v3, v4}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 320
    .line 321
    .line 322
    move-result-wide v3

    .line 323
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    const-string v3, "isAppShortcut"

    .line 328
    .line 329
    invoke-virtual {v1, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    iget-boolean p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    .line 334
    .line 335
    invoke-virtual {v1, p0}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    if-eqz v2, :cond_6

    .line 340
    .line 341
    invoke-static {v2}, Ls1/q;->b(Landroid/graphics/Bitmap;)[B

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    if-eqz v1, :cond_6

    .line 346
    .line 347
    const-string v2, "icon"

    .line 348
    .line 349
    invoke-virtual {p0, v2}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    array-length v2, v1

    .line 354
    invoke-static {v1, v5, v2, v5}, Landroid/util/Base64;->encodeToString([BIII)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    invoke-virtual {p0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    :cond_6
    if-eqz v6, :cond_7

    .line 363
    .line 364
    const-string v1, "iconResource"

    .line 365
    .line 366
    invoke-virtual {p0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    iget-object v1, v6, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {p0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    const-string v1, "iconResourcePackage"

    .line 377
    .line 378
    invoke-virtual {p0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    iget-object v1, v6, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {p0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    :cond_7
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    invoke-virtual {p0}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object p0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 396
    return-object p0

    .line 397
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 400
    .line 401
    .line 402
    const-string v2, "Exception when adding shortcut: "

    .line 403
    .line 404
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object p0

    .line 414
    const-string v1, "InstallShortcutReceiver"

    .line 415
    .line 416
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    .line 418
    .line 419
    return-object v0
.end method

.method public b()Landroid/util/Pair;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 11
    .line 12
    iget-object v5, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {v5}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-static {v0, v4, v5}, Lcom/android/launcher3/InstallShortcutReceiver;->c(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/P2;)Lcom/android/launcher3/model/data/I;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 25
    .line 26
    if-eqz v4, :cond_2

    .line 27
    .line 28
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-eqz v4, :cond_2

    .line 33
    .line 34
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-nez v4, :cond_2

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 51
    .line 52
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    const-string v5, "cn.nubia.gamelauncher"

    .line 61
    .line 62
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-nez v4, :cond_0

    .line 67
    .line 68
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    const-string v5, "cn.nubia.redmagickyi"

    .line 79
    .line 80
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-nez v4, :cond_0

    .line 85
    .line 86
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 87
    .line 88
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    const-string v5, "cn.nubia.inspiredwallpaper"

    .line 97
    .line 98
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_2

    .line 103
    .line 104
    :cond_0
    iget-object v4, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 105
    .line 106
    iget-object v5, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 107
    .line 108
    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    invoke-virtual {v4, v5}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    iput v3, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 116
    .line 117
    iget-object v4, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 118
    .line 119
    const-class v5, Landroid/content/pm/LauncherApps;

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    check-cast v4, Landroid/content/pm/LauncherApps;

    .line 126
    .line 127
    iget-object v5, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 128
    .line 129
    iget-object v6, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 130
    .line 131
    invoke-virtual {v4, v5, v6}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    if-nez v4, :cond_1

    .line 136
    .line 137
    return-object v2

    .line 138
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 139
    .line 140
    invoke-static {v5}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-virtual {v5}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    invoke-virtual {v4}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v5, v4}, Lt1/f;->t(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    iget-object v5, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 157
    .line 158
    invoke-static {v5}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    new-instance v6, Ls1/b$c;

    .line 163
    .line 164
    invoke-direct {v6}, Ls1/b$c;-><init>()V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 168
    .line 169
    invoke-virtual {v6, p0}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0, v3}, Ls1/b$c;->b(Z)Ls1/b$c;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-virtual {v5, v4, p0}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {v5}, Ls1/X;->n0()V

    .line 182
    .line 183
    .line 184
    iput-object p0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_2
    iput v3, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 188
    .line 189
    iget p0, v0, Lcom/android/launcher3/model/data/I;->m:I

    .line 190
    .line 191
    or-int/lit8 p0, p0, 0x2

    .line 192
    .line 193
    iput p0, v0, Lcom/android/launcher3/model/data/I;->m:I

    .line 194
    .line 195
    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/y;->setShortcutAddFromOtherApp(Z)V

    .line 196
    .line 197
    .line 198
    :cond_3
    invoke-static {v0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    return-object p0

    .line 203
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 204
    .line 205
    if-eqz v0, :cond_5

    .line 206
    .line 207
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 208
    .line 209
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 210
    .line 211
    iget-object v3, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 212
    .line 213
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/y;->setShortcutAddFromOtherApp(Z)V

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 220
    .line 221
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 230
    .line 231
    invoke-virtual {v1, v0, v2}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->b:Landroid/content/pm/ShortcutInfo;

    .line 235
    .line 236
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    return-object p0

    .line 241
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 242
    .line 243
    if-eqz v0, :cond_6

    .line 244
    .line 245
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 246
    .line 247
    invoke-static {v1, v0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    new-instance v1, Lcom/android/launcher3/model/data/A;

    .line 252
    .line 253
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 254
    .line 255
    const-string v4, "appWidgetId"

    .line 256
    .line 257
    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    iget-object v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 262
    .line 263
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    .line 264
    .line 265
    .line 266
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 267
    .line 268
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    iget v3, v0, Lcom/android/launcher3/widget/U;->i:I

    .line 273
    .line 274
    iput v3, v1, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 275
    .line 276
    iget v3, v0, Lcom/android/launcher3/widget/U;->j:I

    .line 277
    .line 278
    iput v3, v1, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 279
    .line 280
    iget v3, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 281
    .line 282
    iget v4, v2, Lcom/android/launcher3/F1;->H0:I

    .line 283
    .line 284
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    iput v3, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 289
    .line 290
    iget v0, v0, Lcom/android/launcher3/widget/U;->h:I

    .line 291
    .line 292
    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    .line 293
    .line 294
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    iput v0, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 299
    .line 300
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->c:Landroid/appwidget/AppWidgetProviderInfo;

    .line 301
    .line 302
    invoke-static {v1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    return-object p0

    .line 307
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->d:Landroid/content/Intent;

    .line 308
    .line 309
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 310
    .line 311
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 312
    .line 313
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/InstallShortcutReceiver;->c(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/P2;)Lcom/android/launcher3/model/data/I;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    invoke-static {p0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    .line 2
    .line 3
    return p0
.end method
