.class public LD1/h;
.super Ljava/lang/Object;
.source "PinRequestHelper.java"


# direct methods
.method public static synthetic a(JLandroid/content/pm/LauncherApps$PinItemRequest;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/os/SystemClock;->sleep(J)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept()Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static b(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;)Landroid/content/pm/LauncherApps$PinItemRequest;
    .locals 2

    .line 1
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 8
    .line 9
    const-class v1, Landroid/content/pm/ShortcutManager;

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/content/pm/ShortcutManager;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutManager;->createShortcutResultIntent(Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/content/pm/LauncherApps;->getPinItemRequest(Landroid/content/Intent;)Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static c(Landroid/content/Context;Landroid/content/pm/LauncherApps$PinItemRequest;J)Lcom/android/launcher3/model/data/I;
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v1, v2, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    cmp-long v1, p2, v1

    .line 20
    .line 21
    if-gtz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 31
    .line 32
    new-instance v1, LD1/g;

    .line 33
    .line 34
    invoke-direct {v1, p2, p3, p1}, LD1/g;-><init>(JLandroid/content/pm/LauncherApps$PinItemRequest;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance p2, Lcom/android/launcher3/model/data/I;

    .line 45
    .line 46
    invoke-direct {p2, p1, p0}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    sget-object v0, Ls1/g;->a:Ls1/g;

    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ls1/h;

    .line 60
    .line 61
    invoke-direct {v2, p1, p0}, Ls1/h;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p0, v1, v2}, Ls1/g;->o(Landroid/content/Context;Lt1/f;Ls1/h;)Ls1/d;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iput-object p0, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 69
    .line 70
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/D3;->d1(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;)V

    .line 75
    .line 76
    .line 77
    return-object p2

    .line 78
    :cond_2
    return-object v0
.end method

.method public static d(Landroid/content/Intent;)Landroid/content/pm/LauncherApps$PinItemRequest;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const-string v1, "android.content.pm.extra.PIN_ITEM_REQUEST"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v1, p0, Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    check-cast p0, Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    return-object v0
.end method
