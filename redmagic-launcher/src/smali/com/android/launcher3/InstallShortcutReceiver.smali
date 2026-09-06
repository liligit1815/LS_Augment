.class public Lcom/android/launcher3/InstallShortcutReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/InstallShortcutReceiver$b;,
        Lcom/android/launcher3/InstallShortcutReceiver$a;
    }
.end annotation


# static fields
.field private static a:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static synthetic a(Landroid/content/Context;Lcom/android/launcher3/InstallShortcutReceiver$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/InstallShortcutReceiver;->d(Landroid/content/Context;Lcom/android/launcher3/InstallShortcutReceiver$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/InstallShortcutReceiver;->n(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/P2;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/InstallShortcutReceiver;->i(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/P2;)Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static d(Landroid/content/Context;Lcom/android/launcher3/InstallShortcutReceiver$b;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/InstallShortcutReceiver$b;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 6
    .line 7
    invoke-static {v1}, Lx1/O;->g2(Landroid/content/Intent;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-static {p0, v2}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v1, p1, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v1}, Lx1/O;->m3(Landroid/content/Intent;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-static {p0, v2}, Lx1/O;->v5(Landroid/content/Context;Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p1, p1, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 29
    .line 30
    invoke-static {p1}, Lx1/O;->s2(Landroid/content/Intent;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-static {p0, v2}, Lx1/O;->r5(Landroid/content/Context;Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    sget-object p1, Lcom/android/launcher3/resource/B;->l:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_4

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/lang/String;

    .line 56
    .line 57
    const-string v2, "com.android.launcher3.prefs.concise"

    .line 58
    .line 59
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    const-string v1, "InstallShortcutReceiver"

    .line 66
    .line 67
    const-string v2, "addToQueue, disable add shortcut in concise mode!"

    .line 68
    .line 69
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/InstallShortcutReceiver;->s(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    return-void
.end method

.method private static e(Lcom/android/launcher3/InstallShortcutReceiver$b;)Lcom/android/launcher3/InstallShortcutReceiver$b;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/InstallShortcutReceiver$b;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v2, "cn.nubia.redmagickyi"

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move v4, v2

    .line 39
    move v2, v1

    .line 40
    move v1, v4

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v3, "cn.nubia.inspiredwallpaper"

    .line 53
    .line 54
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move v2, v1

    .line 62
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/android/launcher3/util/J1;->i(Landroid/content/Intent;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    if-nez v2, :cond_3

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 76
    .line 77
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 88
    .line 89
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    :goto_1
    return-object p0

    .line 96
    :cond_4
    new-instance v1, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->e:Landroid/content/Context;

    .line 99
    .line 100
    invoke-direct {v1, v0, p0}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/content/pm/LauncherActivityInfo;Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    return-object v1
.end method

.method public static f(Landroid/content/Context;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, "cn.nubia.gamelauncher"

    .line 4
    .line 5
    const-string v2, "cn.nubia.gamelauncher.activity.GameSpaceActivity"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/content/Intent;

    .line 11
    .line 12
    const-string v2, "android.intent.action.MAIN"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string v0, "android.intent.category.LAUNCHER"

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/content/Intent;

    .line 26
    .line 27
    const-string v2, "cn.nubia.launcher.gamespace.action.INSTALL_SHORTCUT"

    .line 28
    .line 29
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const v3, 0x7f1401cf

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const v3, 0x7f080c22

    .line 44
    .line 45
    .line 46
    invoke-static {p0, v3}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-string v4, "android.intent.extra.shortcut.NAME"

    .line 51
    .line 52
    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    const-string v2, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    const-string v2, "android.intent.extra.shortcut.INTENT"

    .line 61
    .line 62
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    const-string v1, "fromPkgName"

    .line 66
    .line 67
    const-string v2, "com.zte.mifavor.launcher"

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    invoke-static {p0, v0}, Lcom/android/launcher3/InstallShortcutReceiver;->g(Landroid/content/Context;Landroid/content/Intent;)Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v3, "createGameSpaceShortcut info:"

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const-string v3, "InstallShortcutReceiver"

    .line 94
    .line 95
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    if-eqz v1, :cond_0

    .line 99
    .line 100
    invoke-static {v1, p0}, Lcom/android/launcher3/InstallShortcutReceiver;->r(Lcom/android/launcher3/InstallShortcutReceiver$b;Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method private static g(Landroid/content/Context;Landroid/content/Intent;)Lcom/android/launcher3/InstallShortcutReceiver$b;
    .locals 5

    .line 1
    const-string v0, "android.intent.extra.shortcut.INTENT"

    .line 2
    .line 3
    const-class v1, Landroid/content/Intent;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/InstallShortcutReceiver;->q(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const-string v2, "Invalid install shortcut intent"

    .line 11
    .line 12
    const-string v3, "InstallShortcutReceiver"

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    const-string v0, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 17
    .line 18
    const-class v4, Landroid/content/Intent$ShortcutIconResource;

    .line 19
    .line 20
    invoke-static {p1, v0, v4}, Lcom/android/launcher3/InstallShortcutReceiver;->q(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    const-string v0, "android.intent.extra.shortcut.ICON"

    .line 27
    .line 28
    const-class v4, Landroid/graphics/Bitmap;

    .line 29
    .line 30
    invoke-static {p1, v0, v4}, Lcom/android/launcher3/InstallShortcutReceiver;->q(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    new-instance v0, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 38
    .line 39
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-direct {v0, p1, v4, p0}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/content/Intent;Landroid/os/UserHandle;Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, v0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    iget-object p0, v0, Lcom/android/launcher3/InstallShortcutReceiver$b;->g:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-static {v0}, Lcom/android/launcher3/InstallShortcutReceiver;->e(Lcom/android/launcher3/InstallShortcutReceiver$b;)Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    :goto_0
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    return-object v1

    .line 64
    :cond_3
    :goto_1
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-object v1
.end method

.method public static h(Landroid/content/Context;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, "cn.nubia.redmagickyi"

    .line 4
    .line 5
    const-string v2, "cn.nubia.redmagickyi.guide.activity.RedmagicStartActivity"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/content/Intent;

    .line 11
    .line 12
    const-string v2, "android.intent.action.MAIN"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v2, "android.intent.category.LAUNCHER"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/content/Intent;

    .line 26
    .line 27
    const-string v2, "cn.nubia.launcher.gamespace.action.INSTALL_SHORTCUT"

    .line 28
    .line 29
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const v3, 0x7f140341

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const v3, 0x7f081158

    .line 44
    .line 45
    .line 46
    invoke-static {p0, v3}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-string v4, "android.intent.extra.shortcut.NAME"

    .line 51
    .line 52
    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    const-string v2, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    const-string v2, "android.intent.extra.shortcut.INTENT"

    .line 61
    .line 62
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    const-string v1, "fromPkgName"

    .line 66
    .line 67
    const-string v2, "com.zte.mifavor.launcher"

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    invoke-static {p0, v0}, Lcom/android/launcher3/InstallShortcutReceiver;->g(Landroid/content/Context;Landroid/content/Intent;)Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v3, "createtcutRedMagicKyi info:"

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const-string v3, "InstallShortcutReceiver"

    .line 94
    .line 95
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    if-eqz v1, :cond_0

    .line 99
    .line 100
    invoke-static {v1, p0}, Lcom/android/launcher3/InstallShortcutReceiver;->r(Lcom/android/launcher3/InstallShortcutReceiver$b;Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method private static i(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/P2;)Lcom/android/launcher3/model/data/I;
    .locals 6

    .line 1
    const-string v0, "InstallShortcutReceiver"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    const-string p0, "Can\'t construct WorkspaceItemInfo with null data"

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    const-string v2, "android.intent.extra.shortcut.INTENT"

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroid/content/Intent;

    .line 19
    .line 20
    const-string v3, "android.intent.extra.shortcut.NAME"

    .line 21
    .line 22
    invoke-virtual {p0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "android.intent.extra.shortcut.ICON"

    .line 27
    .line 28
    invoke-virtual {p0, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    const-string p0, "Can\'t construct WorkspaceItemInfo with null intent"

    .line 35
    .line 36
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_1
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    instance-of v5, v4, Landroid/graphics/Bitmap;

    .line 56
    .line 57
    if-eqz v5, :cond_2

    .line 58
    .line 59
    check-cast v4, Landroid/graphics/Bitmap;

    .line 60
    .line 61
    invoke-virtual {p1, v4}, Ls1/b;->v(Landroid/graphics/Bitmap;)Ls1/d;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const-string v4, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 67
    .line 68
    invoke-virtual {p0, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    instance-of v4, p0, Landroid/content/Intent$ShortcutIconResource;

    .line 73
    .line 74
    if-eqz v4, :cond_3

    .line 75
    .line 76
    check-cast p0, Landroid/content/Intent$ShortcutIconResource;

    .line 77
    .line 78
    iput-object p0, v0, Lcom/android/launcher3/model/data/I;->q:Landroid/content/Intent$ShortcutIconResource;

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Ls1/b;->t(Landroid/content/Intent$ShortcutIconResource;)Ls1/d;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    :cond_3
    :goto_0
    invoke-virtual {p1}, Ls1/X;->n0()V

    .line 85
    .line 86
    .line 87
    if-nez v1, :cond_4

    .line 88
    .line 89
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    iget-object p1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    :cond_4
    iput-object v1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 100
    .line 101
    invoke-static {v3}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iput-object p0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 106
    .line 107
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iget-object p1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 116
    .line 117
    iget-object p2, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 118
    .line 119
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/PackageManager;->getUserBadgedLabel(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    iput-object p0, v0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 124
    .line 125
    iput-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 126
    .line 127
    return-object v0
.end method

.method private static j(Ljava/lang/String;Landroid/content/Context;)Lcom/android/launcher3/InstallShortcutReceiver$b;
    .locals 8

    .line 1
    const-string v0, "isQuickApp"

    .line 2
    .line 3
    const-string v1, "isAppShortcut"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    new-instance v3, Lcom/android/launcher3/InstallShortcutReceiver$a;

    .line 7
    .line 8
    invoke-direct {v3, p0, p1, v2}, Lcom/android/launcher3/InstallShortcutReceiver$a;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/launcher3/k1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v4, 0x0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const-class p0, Landroid/content/pm/LauncherApps;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/content/pm/LauncherApps;

    .line 25
    .line 26
    iget-object v0, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->a:Landroid/content/Intent;

    .line 27
    .line 28
    iget-object v5, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->b:Landroid/os/UserHandle;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v5}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_6

    .line 35
    .line 36
    new-instance v0, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/content/pm/LauncherActivityInfo;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :cond_0
    const-string p0, "isDeepShortcut"

    .line 46
    .line 47
    invoke-virtual {v3, p0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    iget-object p0, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->a:Landroid/content/Intent;

    .line 54
    .line 55
    iget-object v1, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->b:Landroid/os/UserHandle;

    .line 56
    .line 57
    invoke-static {p0, v1}, LN1/e;->c(Landroid/content/Intent;Landroid/os/UserHandle;)LN1/e;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, p1}, LN1/e;->a(Landroid/content/Context;)LN1/f;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/16 v1, 0xb

    .line 66
    .line 67
    invoke-virtual {p0, v1}, LN1/f;->d(I)LN1/f$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    return-object v2

    .line 78
    :cond_1
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_2

    .line 83
    .line 84
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Landroid/content/pm/ShortcutInfo;

    .line 89
    .line 90
    const-string v5, "isCustomApp"

    .line 91
    .line 92
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-static {v1, v5, v0}, Lcom/android/launcher3/H5;->a1(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;Z)V

    .line 97
    .line 98
    .line 99
    :cond_2
    new-instance v0, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 100
    .line 101
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    check-cast p0, Landroid/content/pm/ShortcutInfo;

    .line 106
    .line 107
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    return-object v0

    .line 111
    :cond_3
    const-string p0, "isAppWidget"

    .line 112
    .line 113
    invoke-virtual {v3, p0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_6

    .line 118
    .line 119
    iget-object p0, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->a:Landroid/content/Intent;

    .line 120
    .line 121
    const-string v0, "appWidgetId"

    .line 122
    .line 123
    invoke-virtual {p0, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0, p0}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    if-eqz v0, :cond_5

    .line 136
    .line 137
    iget-object v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 138
    .line 139
    iget-object v4, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->a:Landroid/content/Intent;

    .line 140
    .line 141
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v1, v4}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_5

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    iget-object v3, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->b:Landroid/os/UserHandle;

    .line 156
    .line 157
    invoke-virtual {v1, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-nez v1, :cond_4

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_4
    new-instance v1, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 165
    .line 166
    invoke-direct {v1, v0, p0, p1}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/appwidget/AppWidgetProviderInfo;ILandroid/content/Context;)V

    .line 167
    .line 168
    .line 169
    return-object v1

    .line 170
    :cond_5
    :goto_0
    return-object v2

    .line 171
    :cond_6
    new-instance p0, Landroid/content/Intent;

    .line 172
    .line 173
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v0, "android.intent.extra.shortcut.INTENT"

    .line 177
    .line 178
    iget-object v5, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->a:Landroid/content/Intent;

    .line 179
    .line 180
    invoke-virtual {p0, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 181
    .line 182
    .line 183
    const-string v0, "android.intent.extra.shortcut.NAME"

    .line 184
    .line 185
    const-string v5, "name"

    .line 186
    .line 187
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-virtual {p0, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 192
    .line 193
    .line 194
    const-string v0, "icon"

    .line 195
    .line 196
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const-string v5, "iconResource"

    .line 201
    .line 202
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    const-string v6, "iconResourcePackage"

    .line 207
    .line 208
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    if-eqz v0, :cond_7

    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 215
    .line 216
    .line 217
    move-result v7

    .line 218
    if-nez v7, :cond_7

    .line 219
    .line 220
    invoke-static {v0, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    array-length v5, v0

    .line 225
    invoke-static {v0, v4, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    const-string v4, "android.intent.extra.shortcut.ICON"

    .line 230
    .line 231
    invoke-virtual {p0, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 232
    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_7
    if-eqz v5, :cond_8

    .line 236
    .line 237
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-nez v0, :cond_8

    .line 242
    .line 243
    new-instance v0, Landroid/content/Intent$ShortcutIconResource;

    .line 244
    .line 245
    invoke-direct {v0}, Landroid/content/Intent$ShortcutIconResource;-><init>()V

    .line 246
    .line 247
    .line 248
    iput-object v5, v0, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    .line 249
    .line 250
    iput-object v6, v0, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    .line 251
    .line 252
    const-string v4, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 253
    .line 254
    invoke-virtual {p0, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 255
    .line 256
    .line 257
    :cond_8
    :goto_1
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_9

    .line 262
    .line 263
    new-instance v0, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 264
    .line 265
    iget-object v1, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->b:Landroid/os/UserHandle;

    .line 266
    .line 267
    invoke-direct {v0, p0, p1, v1}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/content/Intent;Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 268
    .line 269
    .line 270
    return-object v0

    .line 271
    :cond_9
    new-instance v0, Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 272
    .line 273
    iget-object v1, v3, Lcom/android/launcher3/InstallShortcutReceiver$a;->b:Landroid/os/UserHandle;

    .line 274
    .line 275
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/InstallShortcutReceiver$b;-><init>(Landroid/content/Intent;Landroid/os/UserHandle;Landroid/content/Context;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    .line 277
    .line 278
    return-object v0

    .line 279
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 280
    .line 281
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    .line 283
    .line 284
    const-string v0, "Exception reading shortcut to add: "

    .line 285
    .line 286
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    const-string p1, "InstallShortcutReceiver"

    .line 297
    .line 298
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    .line 300
    .line 301
    return-object v2
.end method

.method public static k(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 13

    .line 1
    invoke-static {}, Lcom/android/launcher3/InstallShortcutReceiver;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "deleteInstallShortcutQueue title="

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "InstallShortcutReceiver"

    .line 25
    .line 26
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    sget-object v1, Lcom/android/launcher3/resource/B;->l:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_3

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_0

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_0

    .line 58
    .line 59
    new-instance v4, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v5, "."

    .line 68
    .line 69
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v5, "apps_to_install"

    .line 73
    .line 74
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    const/4 v6, 0x0

    .line 86
    invoke-interface {v5, v4, v6}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    if-eqz v7, :cond_0

    .line 91
    .line 92
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_2

    .line 101
    .line 102
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v9

    .line 106
    check-cast v9, Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v9, p0}, Lcom/android/launcher3/InstallShortcutReceiver;->j(Ljava/lang/String;Landroid/content/Context;)Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    if-eqz v10, :cond_1

    .line 113
    .line 114
    iget-object v11, v10, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 115
    .line 116
    if-eqz v11, :cond_1

    .line 117
    .line 118
    iget-object v12, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 119
    .line 120
    invoke-virtual {v11, v12}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v11

    .line 124
    if-eqz v11, :cond_1

    .line 125
    .line 126
    iget-object v10, v10, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 127
    .line 128
    iget-object v11, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 129
    .line 130
    invoke-static {v10, v11}, Lz1/t1;->s(Landroid/content/Intent;Landroid/content/Intent;)Z

    .line 131
    .line 132
    .line 133
    move-result v10

    .line 134
    if-eqz v10, :cond_1

    .line 135
    .line 136
    move-object v6, v9

    .line 137
    :cond_2
    if-eqz v6, :cond_0

    .line 138
    .line 139
    invoke-interface {v7, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-instance v6, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    const-string v8, "deleteInstallShortcutQueue pref remove title="

    .line 148
    .line 149
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v8, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 153
    .line 154
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v8, " pref="

    .line 158
    .line 159
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-interface {v3, v4, v7}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 181
    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_3
    return-void
.end method

.method static l(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    const-string p0, ""

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    return-object p2
.end method

.method public static m(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/InstallShortcutReceiver;->a:I

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
    new-instance v1, Lcom/android/launcher3/j1;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/android/launcher3/j1;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static n(Landroid/content/Context;)V
    .locals 9

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
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/InstallShortcutReceiver;->o()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v4, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v5, "flushQueueInBackground appPendingInstallKey="

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v5, " strings="

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    const-string v5, "InstallShortcutReceiver"

    .line 55
    .line 56
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    new-instance v4, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v6, "Getting and clearing APPS_PENDING_INSTALL: "

    .line 65
    .line 66
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    if-nez v3, :cond_1

    .line 80
    .line 81
    goto/16 :goto_1

    .line 82
    .line 83
    :cond_1
    const-class v4, Landroid/content/pm/LauncherApps;

    .line 84
    .line 85
    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Landroid/content/pm/LauncherApps;

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    if-eqz v6, :cond_8

    .line 100
    .line 101
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    check-cast v6, Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v6, p0}, Lcom/android/launcher3/InstallShortcutReceiver;->j(Ljava/lang/String;Landroid/content/Context;)Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    if-nez v6, :cond_3

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    iget-object v7, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 115
    .line 116
    invoke-static {v7}, Lcom/android/launcher3/InstallShortcutReceiver;->p(Landroid/content/Intent;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v8

    .line 124
    if-nez v8, :cond_4

    .line 125
    .line 126
    iget-object v8, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->h:Landroid/os/UserHandle;

    .line 127
    .line 128
    invoke-virtual {v4, v7, v8}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    if-nez v7, :cond_4

    .line 133
    .line 134
    iget-boolean v7, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->a:Z

    .line 135
    .line 136
    if-nez v7, :cond_4

    .line 137
    .line 138
    new-instance v7, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v8, "Ignoring shortcut for absent package: "

    .line 144
    .line 145
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object v6, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 149
    .line 150
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    const-string v8, "flushQueueInBackground  "

    .line 167
    .line 168
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    iget-object v8, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 172
    .line 173
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    invoke-virtual {v6}, Lcom/android/launcher3/InstallShortcutReceiver$b;->b()Landroid/util/Pair;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    if-eqz v7, :cond_5

    .line 188
    .line 189
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_5
    new-instance v7, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    const-string v8, "flushQueueInBackground itemInfoObject null, isGameLauncherIntent="

    .line 199
    .line 200
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-object v8, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 204
    .line 205
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    iget-object v7, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 216
    .line 217
    invoke-static {v7}, Lx1/O;->g2(Landroid/content/Intent;)Z

    .line 218
    .line 219
    .line 220
    move-result v7

    .line 221
    const/4 v8, 0x0

    .line 222
    if-eqz v7, :cond_6

    .line 223
    .line 224
    invoke-static {p0, v8}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 225
    .line 226
    .line 227
    :cond_6
    iget-object v7, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 228
    .line 229
    invoke-static {v7}, Lx1/O;->m3(Landroid/content/Intent;)Z

    .line 230
    .line 231
    .line 232
    move-result v7

    .line 233
    if-eqz v7, :cond_7

    .line 234
    .line 235
    invoke-static {p0, v8}, Lx1/O;->v5(Landroid/content/Context;Z)V

    .line 236
    .line 237
    .line 238
    :cond_7
    iget-object v6, v6, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 239
    .line 240
    invoke-static {v6}, Lx1/O;->s2(Landroid/content/Intent;)Z

    .line 241
    .line 242
    .line 243
    move-result v6

    .line 244
    if-eqz v6, :cond_2

    .line 245
    .line 246
    invoke-static {p0, v8}, Lx1/O;->r5(Landroid/content/Context;Z)V

    .line 247
    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :cond_8
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    invoke-interface {v2, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    if-nez v1, :cond_9

    .line 267
    .line 268
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 277
    .line 278
    .line 279
    :cond_9
    :goto_1
    return-void
.end method

.method private static o()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->k()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "."

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "apps_to_install"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
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

.method private static q(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private static r(Lcom/android/launcher3/InstallShortcutReceiver$b;Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/i1;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0}, Lcom/android/launcher3/i1;-><init>(Landroid/content/Context;Lcom/android/launcher3/InstallShortcutReceiver$b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/InstallShortcutReceiver;->m(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static s(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p2, "."

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p2, "apps_to_install"

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ljava/util/HashSet;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v0, 0x1

    .line 41
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 42
    .line 43
    .line 44
    :goto_0
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "com.android.launcher.action.INSTALL_SHORTCUT"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const-string p0, "cn.nubia.launcher.gamespace.action.INSTALL_SHORTCUT"

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v0, "onReceive data:"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "InstallShortcutReceiver"

    .line 44
    .line 45
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p2}, Lcom/android/launcher3/InstallShortcutReceiver;->g(Landroid/content/Context;Landroid/content/Intent;)Lcom/android/launcher3/InstallShortcutReceiver$b;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/InstallShortcutReceiver$b;->c()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_1

    .line 59
    .line 60
    new-instance p2, Lcom/android/launcher3/util/J1;

    .line 61
    .line 62
    invoke-direct {p2, p1}, Lcom/android/launcher3/util/J1;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Lcom/android/launcher3/util/J1;->g(Landroid/content/Context;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_1

    .line 70
    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string p2, "Ignoring malicious intent "

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/InstallShortcutReceiver$b;->f:Landroid/content/Intent;

    .line 82
    .line 83
    const/4 p2, 0x0

    .line 84
    invoke-virtual {p0, p2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    invoke-static {p0, p1}, Lcom/android/launcher3/InstallShortcutReceiver;->r(Lcom/android/launcher3/InstallShortcutReceiver$b;Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    :goto_0
    return-void
.end method
