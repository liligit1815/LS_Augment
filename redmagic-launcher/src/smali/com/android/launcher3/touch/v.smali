.class public Lcom/android/launcher3/touch/v;
.super Ljava/lang/Object;
.source "ItemClickHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/touch/v$a;
    }
.end annotation


# static fields
.field public static final a:Landroid/view/View$OnClickListener;

.field public static final b:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/touch/j;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/touch/j;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/touch/v;->a:Landroid/view/View$OnClickListener;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/touch/m;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/touch/m;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/touch/v;->b:Landroid/view/View$OnClickListener;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Landroid/content/Intent;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/concurrent/CompletableFuture;Ljava/util/function/Consumer;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/CompletableFuture;->thenAcceptAsync(Ljava/util/function/Consumer;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/I;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/android/launcher3/util/P0;->v(Ljava/util/Set;)Ljava/util/function/Predicate;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "user explicitly removes disabled shortcut"

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/Workspace;->B2(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, LR0/m;->b(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x2

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p0}, LR0/m;->c(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/touch/v;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/g;->t(Lcom/android/launcher3/util/E;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Lcom/android/launcher3/touch/l;

    .line 16
    .line 17
    invoke-direct {p0, p2}, Lcom/android/launcher3/touch/l;-><init>(Lcom/android/launcher3/C2;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/lang/String;Landroid/content/pm/PackageInstaller$SessionInfo;)V
    .locals 3

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/v;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/util/b;->a()Landroid/os/Bundle;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, p4, v2, v1}, Landroid/content/pm/LauncherApps;->startPackageInstallerSessionDetailsActivity(Landroid/content/pm/PackageInstaller$SessionInfo;Landroid/graphics/Rect;Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p4

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "Unable to launch market intent for package="

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "ItemClickHandler"

    .line 43
    .line 44
    invoke-static {v1, v0, p4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    :cond_0
    sget-object p4, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 48
    .line 49
    invoke-virtual {p4, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p4

    .line 53
    check-cast p4, Lcom/android/launcher3/util/f;

    .line 54
    .line 55
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 56
    .line 57
    invoke-virtual {p4, p3, v0}, Lcom/android/launcher3/util/f;->f(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-virtual {p0, p1, p3, p2}, Lcom/android/launcher3/C2;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Ljava/lang/String;)Landroid/content/pm/PackageInstaller$SessionInfo;
    .locals 1

    .line 1
    sget-object v0, LD1/b;->f:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LD1/b;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, LD1/b;->a(Landroid/os/UserHandle;Ljava/lang/String;)Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic i(Lcom/android/launcher3/C2;Ljava/lang/String;Lcom/android/launcher3/model/data/y;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-static {p1, p2}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "user explicitly removes the promise app icon"

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/Workspace;->B2(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/touch/v;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static l(Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/16 v0, 0x3e7

    .line 16
    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lh1/a;->j(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->O0:Z

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lh1/a;->K(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method private static m(Lcom/android/launcher3/C2;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "ItemClickHandler"

    .line 14
    .line 15
    const-string p1, "onClick--isShowMenuWidgets()==true"

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public static n(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/touch/v;->o(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    and-int/lit16 v0, v0, 0x1033

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/model/data/I;->l:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->l:Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-static {p1, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 32
    .line 33
    .line 34
    return v2

    .line 35
    :cond_2
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 36
    .line 37
    and-int/lit8 v3, v0, 0x1

    .line 38
    .line 39
    if-eqz v3, :cond_3

    .line 40
    .line 41
    const p0, 0x7f140344

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    and-int/lit8 v3, v0, 0x10

    .line 46
    .line 47
    if-nez v3, :cond_5

    .line 48
    .line 49
    and-int/lit8 v3, v0, 0x20

    .line 50
    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    const p0, 0x7f140046

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_5
    :goto_0
    and-int/lit8 v0, v0, 0x10

    .line 59
    .line 60
    const-string v3, "ItemClickHandler"

    .line 61
    .line 62
    if-eqz v0, :cond_6

    .line 63
    .line 64
    const-string v0, "handleDisabledItemClicked: FLAG_DISABLED_BY_PUBLISHER"

    .line 65
    .line 66
    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    :cond_6
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 70
    .line 71
    and-int/lit8 p0, p0, 0x20

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const-string p0, "handleDisabledItemClicked: FLAG_DISABLED_LOCKED_USER"

    .line 76
    .line 77
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    if-eqz p0, :cond_7

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_7

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->u0()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_7

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    new-instance v0, Lz1/I4;

    .line 107
    .line 108
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-direct {v0, v3, v2}, Lz1/I4;-><init>(Landroid/os/UserHandle;Z)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 116
    .line 117
    .line 118
    :cond_7
    const p0, 0x7f1403d4

    .line 119
    .line 120
    .line 121
    :goto_1
    invoke-static {p1, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 126
    .line 127
    .line 128
    return v2
.end method

.method private static o(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget v2, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 7
    .line 8
    const/4 v3, 0x6

    .line 9
    if-ne v2, v3, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->a0()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/model/data/z;->w(Landroid/content/Context;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    return v0

    .line 24
    :cond_0
    new-instance v3, Lx1/e;

    .line 25
    .line 26
    invoke-direct {v3, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    const v4, 0x7f14018d

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v4}, Lx1/e;->n(I)Lx1/e;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const v4, 0x7f14018c

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v4}, Lx1/e;->d(I)Lx1/e;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    new-instance v4, Lcom/android/launcher3/touch/p;

    .line 44
    .line 45
    invoke-direct {v4, p1, v2}, Lcom/android/launcher3/touch/p;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    const p1, 0x7f14018b

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, p1, v4}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v2, Lcom/android/launcher3/touch/q;

    .line 56
    .line 57
    invoke-direct {v2, v1, p0}, Lcom/android/launcher3/touch/q;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/I;)V

    .line 58
    .line 59
    .line 60
    const p0, 0x7f14018a

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p0, v2}, Lx1/e;->h(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lx1/e;->p()Landroid/app/Dialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x1

    .line 71
    return p0

    .line 72
    :catch_0
    move-exception p0

    .line 73
    const-string p1, "ItemClickHandler"

    .line 74
    .line 75
    const-string v1, "Error creating alert dialog"

    .line 76
    .line 77
    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    .line 79
    .line 80
    :cond_1
    return v0
.end method

.method private static p(Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Lcom/android/launcher3/touch/k;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/touch/k;-><init>(Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 p0, 0x64

    .line 49
    .line 50
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_0
    move-exception p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public static q(Landroid/view/View;)V
    .locals 7

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    const-string v1, "ItemClickHandler"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 9
    .line 10
    new-instance v2, Lcom/android/launcher3/touch/n;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Lcom/android/launcher3/touch/n;-><init>(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v2}, Lcom/android/launcher3/BubbleTextView;->N(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    :cond_1
    const-string p0, "onClick: window token is null."

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Lcom/android/launcher3/Workspace;->E1()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_3

    .line 50
    .line 51
    const-string p0, "onClick: is in switching state."

    .line 52
    .line 53
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    invoke-static {p0}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_5

    .line 62
    .line 63
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    goto/16 :goto_1

    .line 70
    .line 71
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 72
    .line 73
    iget v1, v1, Lcom/android/launcher3/model/data/y;->id:I

    .line 74
    .line 75
    invoke-static {v1}, Lcom/android/launcher3/folderbatch/g;->c(I)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/C2;->G4(Ljava/util/List;Lcom/android/launcher3/folder/Folder;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    add-int/lit8 p0, p0, -0x1

    .line 103
    .line 104
    invoke-static {v0, p0}, Lh1/a;->i(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->n2()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    if-eqz v2, :cond_6

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v2}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    if-eqz v2, :cond_6

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2}, Lcom/android/launcher3/W3;->o()Lcom/android/launcher3/W3$e;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    sget-object v3, Lcom/android/launcher3/W3$e;->m:Lcom/android/launcher3/W3$e;

    .line 140
    .line 141
    if-ne v2, v3, :cond_6

    .line 142
    .line 143
    const-string p0, "onClick: launcher unlock animation is running."

    .line 144
    .line 145
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_6
    sget-object v2, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Lcom/android/launcher3/anim/C;

    .line 160
    .line 161
    invoke-static {v0, p0}, Lcom/android/launcher3/touch/v;->m(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-eqz v3, :cond_7

    .line 166
    .line 167
    const-string p0, "onClick is in disableClickMFV"

    .line 168
    .line 169
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    sget-object v4, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-eqz v3, :cond_8

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->u2()Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-eqz v3, :cond_8

    .line 190
    .line 191
    const-string p0, "onClick is disable in MENU_MAIN & screen lock"

    .line 192
    .line 193
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->O0:Z

    .line 206
    .line 207
    invoke-static {v0, v4, v3}, Lcom/android/launcher3/touch/w;->c(Landroid/content/Context;ZLjava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v4

    .line 211
    if-eqz v4, :cond_9

    .line 212
    .line 213
    new-instance p0, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    const-string v2, "raw isInMultiWindowMode "

    .line 219
    .line 220
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    new-instance v5, Ljava/lang/StringBuilder;

    .line 243
    .line 244
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 245
    .line 246
    .line 247
    const-string v6, "onClick: appsView.gotoSearchResultAndTheAnimationIsRunning()="

    .line 248
    .line 249
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    if-nez v4, :cond_a

    .line 253
    .line 254
    const-string v6, "null"

    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_a
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/r;->N()Z

    .line 258
    .line 259
    .line 260
    move-result v6

    .line 261
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 262
    .line 263
    .line 264
    move-result-object v6

    .line 265
    :goto_0
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    if-eqz v4, :cond_b

    .line 276
    .line 277
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/r;->N()Z

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    if-eqz v4, :cond_b

    .line 282
    .line 283
    goto/16 :goto_1

    .line 284
    .line 285
    :cond_b
    invoke-static {}, Lx1/O;->Y2()Z

    .line 286
    .line 287
    .line 288
    move-result v4

    .line 289
    if-nez v4, :cond_d

    .line 290
    .line 291
    instance-of v4, p0, Lcom/android/launcher3/BubbleTextView;

    .line 292
    .line 293
    if-eqz v4, :cond_c

    .line 294
    .line 295
    invoke-virtual {v2}, Lcom/android/launcher3/anim/C;->C()Landroid/view/View;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    if-ne v4, p0, :cond_c

    .line 300
    .line 301
    invoke-virtual {v0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 302
    .line 303
    .line 304
    move-result v4

    .line 305
    if-nez v4, :cond_c

    .line 306
    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .line 311
    .line 312
    const-string v2, "Click the same icon, ignore it "

    .line 313
    .line 314
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :cond_c
    instance-of v4, p0, Lcom/android/launcher3/shortcuts/DeepShortcutTextView;

    .line 329
    .line 330
    if-nez v4, :cond_d

    .line 331
    .line 332
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 333
    .line 334
    invoke-interface {v0, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 335
    .line 336
    .line 337
    move-result v4

    .line 338
    if-nez v4, :cond_d

    .line 339
    .line 340
    new-instance v4, Ljava/lang/StringBuilder;

    .line 341
    .line 342
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .line 344
    .line 345
    const-string v5, "onClick: "

    .line 346
    .line 347
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v4

    .line 357
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    .line 359
    .line 360
    invoke-virtual {v2, p0}, Lcom/android/launcher3/anim/C;->o0(Landroid/view/View;)V

    .line 361
    .line 362
    .line 363
    :cond_d
    sget-object v2, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 364
    .line 365
    const-string v4, "Launcher.itemClick"

    .line 366
    .line 367
    invoke-virtual {v2, v4}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    instance-of v2, v3, Lcom/android/launcher3/model/data/I;

    .line 371
    .line 372
    if-eqz v2, :cond_14

    .line 373
    .line 374
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    const/4 v4, 0x0

    .line 379
    invoke-static {v2, v4}, Lx1/O;->K2(Landroid/content/Context;Z)Z

    .line 380
    .line 381
    .line 382
    move-result v2

    .line 383
    if-eqz v2, :cond_e

    .line 384
    .line 385
    move-object v2, v3

    .line 386
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 387
    .line 388
    invoke-static {v2}, Lx1/O;->J2(Lcom/android/launcher3/model/data/I;)Z

    .line 389
    .line 390
    .line 391
    move-result v5

    .line 392
    if-eqz v5, :cond_e

    .line 393
    .line 394
    new-instance v0, Ljava/lang/StringBuilder;

    .line 395
    .line 396
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 397
    .line 398
    .line 399
    const-string v3, "onClick isMinorsModeDisableItem isMinorsModeStateEnable "

    .line 400
    .line 401
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 405
    .line 406
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    .line 415
    .line 416
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    const v0, 0x7f14045c

    .line 421
    .line 422
    .line 423
    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 428
    .line 429
    .line 430
    return-void

    .line 431
    :cond_e
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    sget-object v4, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 436
    .line 437
    invoke-virtual {v2, v4}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    if-eqz v2, :cond_10

    .line 442
    .line 443
    const-string v2, "onClick is in isShowMenuIconArrange"

    .line 444
    .line 445
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    .line 447
    .line 448
    instance-of v2, p0, Lcom/android/launcher3/BubbleTextView;

    .line 449
    .line 450
    if-eqz v2, :cond_f

    .line 451
    .line 452
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 457
    .line 458
    invoke-virtual {v0, p0}, Lcom/android/launcher3/G4;->x(Lcom/android/launcher3/BubbleTextView;)V

    .line 459
    .line 460
    .line 461
    return-void

    .line 462
    :cond_f
    const-string p0, "onClick WorkspaceItemInfo in MENU_ICONARRANGE, v error"

    .line 463
    .line 464
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    .line 466
    .line 467
    return-void

    .line 468
    :cond_10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    invoke-virtual {v2}, Lcom/android/launcher3/q4;->a0()Z

    .line 473
    .line 474
    .line 475
    move-result v2

    .line 476
    if-eqz v2, :cond_12

    .line 477
    .line 478
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 479
    .line 480
    .line 481
    move-result-object v2

    .line 482
    invoke-virtual {v2}, Lcom/android/launcher3/menu/MenuContainer;->C()V

    .line 483
    .line 484
    .line 485
    instance-of v2, p0, Lcom/android/launcher3/BubbleTextView;

    .line 486
    .line 487
    if-eqz v2, :cond_11

    .line 488
    .line 489
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 494
    .line 495
    invoke-virtual {v0, p0}, Lcom/android/launcher3/G4;->x(Lcom/android/launcher3/BubbleTextView;)V

    .line 496
    .line 497
    .line 498
    goto/16 :goto_3

    .line 499
    .line 500
    :cond_11
    const-string p0, "onClick WorkspaceItemInfo in show check box status, v error"

    .line 501
    .line 502
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    .line 504
    .line 505
    goto/16 :goto_3

    .line 506
    .line 507
    :cond_12
    const-string v2, "onClickAppShortcut"

    .line 508
    .line 509
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    .line 511
    .line 512
    move-object v1, v3

    .line 513
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 514
    .line 515
    invoke-static {v0, v1}, Lcom/android/launcher3/nubia/c;->m(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z

    .line 516
    .line 517
    .line 518
    move-result v1

    .line 519
    if-eqz v1, :cond_13

    .line 520
    .line 521
    goto :goto_1

    .line 522
    :cond_13
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 523
    .line 524
    invoke-static {p0, v3, v0}, Lcom/android/launcher3/touch/v;->s(Landroid/view/View;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/C2;)V

    .line 525
    .line 526
    .line 527
    goto/16 :goto_3

    .line 528
    .line 529
    :cond_14
    instance-of v2, v3, Lcom/android/launcher3/model/data/p;

    .line 530
    .line 531
    if-eqz v2, :cond_15

    .line 532
    .line 533
    invoke-static {p0}, Lcom/android/launcher3/touch/v;->t(Landroid/view/View;)V

    .line 534
    .line 535
    .line 536
    const-string p0, "onClickFolderIcon"

    .line 537
    .line 538
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    .line 540
    .line 541
    goto/16 :goto_3

    .line 542
    .line 543
    :cond_15
    instance-of v2, v3, Lcom/android/launcher3/model/data/l;

    .line 544
    .line 545
    if-eqz v2, :cond_16

    .line 546
    .line 547
    invoke-static {p0}, Lcom/android/launcher3/touch/v;->r(Landroid/view/View;)V

    .line 548
    .line 549
    .line 550
    goto/16 :goto_3

    .line 551
    .line 552
    :cond_16
    instance-of v2, v3, Lcom/android/launcher3/model/data/d;

    .line 553
    .line 554
    if-eqz v2, :cond_1d

    .line 555
    .line 556
    const-string v2, "startAppShortcutOrInfoActivity"

    .line 557
    .line 558
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 559
    .line 560
    .line 561
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/suggest/v;->C(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 562
    .line 563
    .line 564
    move-result v2

    .line 565
    if-eqz v2, :cond_17

    .line 566
    .line 567
    const-string p0, "startAppShortcutOrInfoActivity jumpSuggestStatementIfNeed return"

    .line 568
    .line 569
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    .line 571
    .line 572
    return-void

    .line 573
    :cond_17
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/suggest/v;->M(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    if-eqz v1, :cond_18

    .line 578
    .line 579
    goto :goto_1

    .line 580
    :cond_18
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 581
    .line 582
    .line 583
    move-result v1

    .line 584
    if-eqz v1, :cond_19

    .line 585
    .line 586
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/suggest/v;->J(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 587
    .line 588
    .line 589
    :cond_19
    move-object v1, v3

    .line 590
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 591
    .line 592
    invoke-static {v0, v1}, Lcom/android/launcher3/nubia/c;->m(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z

    .line 593
    .line 594
    .line 595
    move-result v1

    .line 596
    if-eqz v1, :cond_1a

    .line 597
    .line 598
    :goto_1
    return-void

    .line 599
    :cond_1a
    check-cast v3, Lcom/android/launcher3/model/data/d;

    .line 600
    .line 601
    iget v1, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 602
    .line 603
    const/16 v2, -0x68

    .line 604
    .line 605
    if-ne v2, v1, :cond_1c

    .line 606
    .line 607
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 608
    .line 609
    .line 610
    move-result-object v1

    .line 611
    instance-of v1, v1, Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 612
    .line 613
    const-string v2, "com.zte.halo.app"

    .line 614
    .line 615
    if-eqz v1, :cond_1b

    .line 616
    .line 617
    invoke-static {}, Lh1/a;->d()V

    .line 618
    .line 619
    .line 620
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 621
    .line 622
    .line 623
    move-result-object v1

    .line 624
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v1

    .line 628
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 629
    .line 630
    .line 631
    move-result v1

    .line 632
    if-eqz v1, :cond_1c

    .line 633
    .line 634
    invoke-static {}, Lh1/a;->f()V

    .line 635
    .line 636
    .line 637
    goto :goto_2

    .line 638
    :cond_1b
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 639
    .line 640
    .line 641
    move-result-object v1

    .line 642
    instance-of v1, v1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 643
    .line 644
    if-eqz v1, :cond_1c

    .line 645
    .line 646
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object v1

    .line 654
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result v1

    .line 658
    if-eqz v1, :cond_1c

    .line 659
    .line 660
    invoke-static {}, Lh1/a;->f()V

    .line 661
    .line 662
    .line 663
    :cond_1c
    :goto_2
    invoke-static {p0, v3, v0}, Lcom/android/launcher3/touch/v;->x(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V

    .line 664
    .line 665
    .line 666
    goto :goto_3

    .line 667
    :cond_1d
    instance-of v2, v3, Lcom/android/launcher3/model/data/A;

    .line 668
    .line 669
    if-eqz v2, :cond_1f

    .line 670
    .line 671
    instance-of v2, p0, Lcom/android/launcher3/widget/F0;

    .line 672
    .line 673
    if-eqz v2, :cond_1e

    .line 674
    .line 675
    check-cast v3, Lcom/android/launcher3/model/data/A;

    .line 676
    .line 677
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v2

    .line 681
    new-instance v3, Ljava/lang/StringBuilder;

    .line 682
    .line 683
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 684
    .line 685
    .line 686
    const-string v4, "onClick: PendingAppWidgetHostView clicked for package="

    .line 687
    .line 688
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    .line 690
    .line 691
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 692
    .line 693
    .line 694
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object v2

    .line 698
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 699
    .line 700
    .line 701
    check-cast p0, Lcom/android/launcher3/widget/F0;

    .line 702
    .line 703
    invoke-static {p0, v0}, Lcom/android/launcher3/touch/v;->w(Lcom/android/launcher3/widget/F0;Lcom/android/launcher3/C2;)V

    .line 704
    .line 705
    .line 706
    goto :goto_3

    .line 707
    :cond_1e
    check-cast v3, Lcom/android/launcher3/model/data/A;

    .line 708
    .line 709
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 710
    .line 711
    .line 712
    move-result-object p0

    .line 713
    new-instance v0, Ljava/lang/StringBuilder;

    .line 714
    .line 715
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 716
    .line 717
    .line 718
    const-string v2, "onClick: LauncherAppWidgetInfo clicked, but not instance of PendingAppWidgetHostView. Returning. package="

    .line 719
    .line 720
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 721
    .line 722
    .line 723
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 724
    .line 725
    .line 726
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object p0

    .line 730
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    .line 732
    .line 733
    goto :goto_3

    .line 734
    :cond_1f
    instance-of v0, v3, Lcom/android/launcher3/touch/v$a;

    .line 735
    .line 736
    if-eqz v0, :cond_20

    .line 737
    .line 738
    check-cast v3, Lcom/android/launcher3/touch/v$a;

    .line 739
    .line 740
    invoke-interface {v3, p0}, Lcom/android/launcher3/touch/v$a;->a(Landroid/view/View;)V

    .line 741
    .line 742
    .line 743
    :cond_20
    :goto_3
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 744
    .line 745
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 746
    .line 747
    .line 748
    return-void
.end method

.method private static r(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast p0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, v0}, Lcom/android/launcher3/model/data/l;->R(Landroid/content/Context;)Lh4/l;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lh4/l;->c()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v0}, Lcom/android/launcher3/model/data/l;->R(Landroid/content/Context;)Lh4/l;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lh4/l;->d()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x0

    .line 44
    if-eqz v2, :cond_5

    .line 45
    .line 46
    if-nez v3, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/l;->isDisabled()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/l;->O()Lcom/android/launcher3/model/data/I;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/l;->P()Lcom/android/launcher3/model/data/I;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    const p0, 0x7f14009a

    .line 76
    .line 77
    .line 78
    invoke-static {v0, p0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_2

    .line 91
    .line 92
    invoke-static {v2, v0}, Lcom/android/launcher3/touch/v;->n(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-nez v2, :cond_3

    .line 97
    .line 98
    :cond_2
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    invoke-static {v1, v0}, Lcom/android/launcher3/touch/v;->n(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    :cond_3
    return-void

    .line 111
    :cond_4
    invoke-virtual {v0, p0}, Lcom/android/launcher3/C2;->B3(Lcom/android/launcher3/apppairs/AppPairIcon;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    :goto_0
    sget-object p0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/android/launcher3/F1;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    new-instance v1, Lcom/android/launcher3/touch/o;

    .line 130
    .line 131
    invoke-direct {v1}, Lcom/android/launcher3/touch/o;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_6

    .line 139
    .line 140
    const p0, 0x7f140099

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_6
    const p0, 0x7f14009b

    .line 145
    .line 146
    .line 147
    :goto_1
    invoke-static {v0, p0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public static s(Landroid/view/View;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Lcom/android/launcher3/touch/v;->n(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_4

    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_4

    .line 35
    .line 36
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_4

    .line 45
    .line 46
    iget v0, p1, Lcom/android/launcher3/model/data/I;->m:I

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    if-ne v0, v2, :cond_2

    .line 50
    .line 51
    new-instance v0, Lcom/android/launcher3/X0;

    .line 52
    .line 53
    invoke-direct {v0, p2}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 65
    .line 66
    invoke-virtual {v0, p2, p0, p1}, Lcom/android/launcher3/X0;->J(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget p1, p1, Lcom/android/launcher3/model/data/z;->h:I

    .line 71
    .line 72
    and-int/lit16 p1, p1, 0x400

    .line 73
    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    const/4 p1, 0x1

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    const/4 p1, 0x0

    .line 79
    :goto_0
    invoke-static {p0, p2, v1, p1}, Lcom/android/launcher3/touch/v;->v(Landroid/view/View;Lcom/android/launcher3/C2;Ljava/lang/String;Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const-string v2, "com.zte.mifavor.zsearch.SearchMainAty"

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_5

    .line 104
    .line 105
    invoke-static {}, Lh1/a;->r()V

    .line 106
    .line 107
    .line 108
    :cond_5
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    if-eqz v1, :cond_6

    .line 113
    .line 114
    if-eqz v0, :cond_6

    .line 115
    .line 116
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    new-instance v0, Lcom/android/launcher3/X0;

    .line 133
    .line 134
    invoke-direct {v0, p2}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 150
    .line 151
    invoke-virtual {v0, p2, v1, p0, p1}, Lcom/android/launcher3/X0;->I(Landroid/content/Context;Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_6
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/touch/v;->x(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method private static t(Landroid/view/View;)V
    .locals 2

    .line 1
    move-object v0, p0

    .line 2
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->q1()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->animateOpen()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 36
    .line 37
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->W:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 42
    .line 43
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method private static u(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->E1()Z

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
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getScroller()Landroid/widget/OverScroller;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const-string v0, "ItemClickHandler"

    .line 55
    .line 56
    const-string v1, "onClickInFolderContent--closeFolder"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 63
    .line 64
    .line 65
    :cond_3
    :goto_0
    return-void
.end method

.method private static v(Landroid/view/View;Lcom/android/launcher3/C2;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/touch/r;

    .line 8
    .line 9
    invoke-direct {v1, p1, v0, p2}, Lcom/android/launcher3/touch/r;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    invoke-static {v1, v2}, Ljava/util/concurrent/CompletableFuture;->supplyAsync(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Lcom/android/launcher3/touch/s;

    .line 19
    .line 20
    invoke-direct {v2, p1, p0, v0, p2}, Lcom/android/launcher3/touch/s;-><init>(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 26
    .line 27
    invoke-virtual {v1, v2, p0}, Ljava/util/concurrent/CompletableFuture;->thenAcceptAsync(Ljava/util/function/Consumer;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance p0, Lx1/e;

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    const p3, 0x7f140008

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p3}, Lx1/e;->n(I)Lx1/e;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const p3, 0x7f140007

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p3}, Lx1/e;->d(I)Lx1/e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance p3, Lcom/android/launcher3/touch/t;

    .line 51
    .line 52
    invoke-direct {p3, v1, v2}, Lcom/android/launcher3/touch/t;-><init>(Ljava/util/concurrent/CompletableFuture;Ljava/util/function/Consumer;)V

    .line 53
    .line 54
    .line 55
    const v1, 0x7f140009

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1, p3}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p3, Lcom/android/launcher3/touch/u;

    .line 63
    .line 64
    invoke-direct {p3, p1, p2, v0}, Lcom/android/launcher3/touch/u;-><init>(Lcom/android/launcher3/C2;Ljava/lang/String;Lcom/android/launcher3/model/data/y;)V

    .line 65
    .line 66
    .line 67
    const p1, 0x7f140006

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1, p3}, Lx1/e;->h(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private static w(Lcom/android/launcher3/widget/F0;Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->isSafeMode()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const p0, 0x7f140345

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0;->h0()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_4

    .line 35
    .line 36
    new-instance p0, Lcom/android/launcher3/widget/Y0;

    .line 37
    .line 38
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 42
    .line 43
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 44
    .line 45
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v1, "ItemClickHandler"

    .line 50
    .line 51
    if-nez p0, :cond_1

    .line 52
    .line 53
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string p1, "onClickPendingWidget: Pending widget ready for click setup, but LauncherAppWidgetProviderInfo was null. Returning. component="

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/A;->getTargetComponent()Landroid/content/ComponentName;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    new-instance v2, Lcom/android/launcher3/widget/N0;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/N0;-><init>(Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v3}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    const/16 p0, 0x10

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_2

    .line 96
    .line 97
    new-instance p0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string p1, "onClickPendingWidget: Pending widget ready for click setup, and LauncherAppWidgetProviderInfo was found. However, no appWidgetId was allocated. Returning. component="

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/A;->getTargetComponent()Landroid/content/ComponentName;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_2
    iget p0, v0, Lcom/android/launcher3/model/data/A;->g:I

    .line 123
    .line 124
    const/16 v1, 0xc

    .line 125
    .line 126
    invoke-virtual {v2, p1, p0, v0, v1}, Lcom/android/launcher3/widget/N0;->e(Lcom/android/launcher3/C2;ILcom/android/launcher3/model/data/y;I)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    const/16 p0, 0xd

    .line 131
    .line 132
    invoke-virtual {v2, p1, v0, p0}, Lcom/android/launcher3/widget/N0;->h(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/A;I)Z

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    iget-object v2, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 137
    .line 138
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iget v0, v0, Lcom/android/launcher3/model/data/A;->j:I

    .line 143
    .line 144
    if-ltz v0, :cond_5

    .line 145
    .line 146
    move v1, v3

    .line 147
    :cond_5
    invoke-static {p0, p1, v2, v1}, Lcom/android/launcher3/touch/v;->v(Landroid/view/View;Lcom/android/launcher3/C2;Ljava/lang/String;Z)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method private static x(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V
    .locals 5

    .line 1
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "start: startAppShortcutOrInfoActivity"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, p1, Lcom/android/launcher3/model/data/z;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    check-cast v1, Lcom/android/launcher3/model/data/z;

    .line 18
    .line 19
    iget v2, v1, Lcom/android/launcher3/model/data/z;->h:I

    .line 20
    .line 21
    and-int/lit16 v2, v2, 0x400

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/launcher3/util/f;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/f;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget v1, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 51
    .line 52
    const/16 v2, 0xb

    .line 53
    .line 54
    if-ne v1, v2, :cond_1

    .line 55
    .line 56
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 57
    .line 58
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/android/launcher3/util/f;

    .line 63
    .line 64
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getPrivateProfileManager()Lcom/android/launcher3/allapps/i0;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/v0;->f()Landroid/os/UserHandle;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v2, "com.zte.mifavor.launcher"

    .line 77
    .line 78
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/f;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->i3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 91
    .line 92
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    :goto_0
    if-eqz v0, :cond_9

    .line 96
    .line 97
    invoke-static {p2, p1}, Lx1/S;->f(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 98
    .line 99
    .line 100
    invoke-static {}, Lx1/S;->r()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_4

    .line 105
    .line 106
    instance-of v1, p1, Lcom/android/launcher3/model/data/I;

    .line 107
    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 111
    .line 112
    if-nez v1, :cond_4

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {}, Lx1/S;->t()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_2

    .line 123
    .line 124
    if-eqz v1, :cond_2

    .line 125
    .line 126
    const-string v2, "cn.nubia.gamelauncher"

    .line 127
    .line 128
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_2

    .line 137
    .line 138
    const-string p0, "ItemClickHandler"

    .line 139
    .line 140
    const-string p1, "startAppShortcutOrInfoActivity,launcher  no start  cn.nubia.gamelauncher"

    .line 141
    .line 142
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    const/high16 v2, 0x10000000

    .line 147
    .line 148
    if-eqz v1, :cond_3

    .line 149
    .line 150
    const-string v3, "cn.nubia.redmagickyi"

    .line 151
    .line 152
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-eqz v3, :cond_3

    .line 161
    .line 162
    new-instance v0, Landroid/content/Intent;

    .line 163
    .line 164
    const-string v3, "intent.action.redmagickyi.main"

    .line 165
    .line 166
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 170
    .line 171
    .line 172
    :cond_3
    if-eqz v1, :cond_4

    .line 173
    .line 174
    const-string v3, "cn.nubia.inspiredwallpaper"

    .line 175
    .line 176
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_4

    .line 185
    .line 186
    new-instance v0, Landroid/content/Intent;

    .line 187
    .line 188
    const-string v1, "intent.action.inspiredwallpaper.main"

    .line 189
    .line 190
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 194
    .line 195
    .line 196
    :cond_4
    instance-of v1, p1, Lcom/android/launcher3/model/data/I;

    .line 197
    .line 198
    if-eqz v1, :cond_6

    .line 199
    .line 200
    move-object v1, p1

    .line 201
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 202
    .line 203
    const/16 v2, 0x8

    .line 204
    .line 205
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-eqz v2, :cond_5

    .line 210
    .line 211
    const-string v2, "android.intent.action.VIEW"

    .line 212
    .line 213
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-eqz v2, :cond_5

    .line 222
    .line 223
    new-instance v2, Landroid/content/Intent;

    .line 224
    .line 225
    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 226
    .line 227
    .line 228
    const/4 v0, 0x0

    .line 229
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 230
    .line 231
    .line 232
    move-object v0, v2

    .line 233
    :cond_5
    iget v1, v1, Lcom/android/launcher3/model/data/I;->o:I

    .line 234
    .line 235
    and-int/lit8 v1, v1, 0x10

    .line 236
    .line 237
    if-eqz v1, :cond_6

    .line 238
    .line 239
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    const/4 v0, 0x0

    .line 244
    invoke-virtual {p2, p0, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 245
    .line 246
    .line 247
    new-instance p0, Lcom/android/launcher3/logging/f;

    .line 248
    .line 249
    invoke-direct {p0}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-virtual {p0}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-interface {p2, v0, p1, p0}, Lcom/android/launcher3/views/k;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :cond_6
    if-eqz p0, :cond_7

    .line 265
    .line 266
    invoke-virtual {p2, p0}, Lcom/android/launcher3/C2;->L4(Landroid/view/View;)Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-eqz v1, :cond_7

    .line 271
    .line 272
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->shouldUseBackgroundAnimation()Z

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    if-nez v1, :cond_7

    .line 277
    .line 278
    const/4 v1, 0x1

    .line 279
    invoke-static {p2, p0, p1, v1}, Lcom/android/launcher3/views/FloatingIconView;->r(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Lcom/android/launcher3/views/FloatingIconView$b;

    .line 280
    .line 281
    .line 282
    :cond_7
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {v1, v2, p1}, Lcom/android/launcher3/c1;->C(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {p2, p0, v0, p1}, Lcom/android/launcher3/C2;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 302
    .line 303
    .line 304
    invoke-static {v0, p1, p2}, Lcom/android/launcher3/touch/v;->l(Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V

    .line 305
    .line 306
    .line 307
    iget p0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 308
    .line 309
    if-nez p0, :cond_8

    .line 310
    .line 311
    invoke-static {v0, p1, p2}, Lcom/android/launcher3/touch/v;->p(Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)V

    .line 312
    .line 313
    .line 314
    :cond_8
    return-void

    .line 315
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 316
    .line 317
    const-string p1, "Input must have a valid intent"

    .line 318
    .line 319
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    throw p0
.end method
