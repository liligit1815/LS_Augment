.class public Lcom/android/launcher3/l0;
.super Ljava/lang/Object;
.source "DisableSystemApp.java"


# instance fields
.field private a:Lcom/android/launcher3/model/data/y;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/l0;->a:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/l0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/l0;->e(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/l0;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/l0;->f(Landroid/content/Context;Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e(Landroid/content/Context;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/l0;->a:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x3

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, p0, v0, v1}, Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v0, "setApplicationEnabledSetting ERROR! "

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "DisableSystemApp"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic f(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p3, "showDisableItemDialog mItemInfo: "

    .line 7
    .line 8
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lcom/android/launcher3/l0;->a:Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const-string p3, "DisableSystemApp"

    .line 21
    .line 22
    invoke-static {p3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/android/launcher3/l0;->a:Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    iget-object p2, p0, Lcom/android/launcher3/l0;->a:Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    sget-object p2, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 48
    .line 49
    new-instance p3, Lcom/android/launcher3/k0;

    .line 50
    .line 51
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/k0;-><init>(Lcom/android/launcher3/l0;Landroid/content/Context;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, p3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method


# virtual methods
.method public d(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)Z
    .locals 3

    .line 1
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2, v0}, Lcom/android/launcher3/util/J1;->o(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/H5;->e(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iput-object p2, p0, Lcom/android/launcher3/l0;->a:Lcom/android/launcher3/model/data/y;

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_2
    return v1
.end method

.method public g(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    const-string v0, "DisableSystemApp"

    .line 2
    .line 3
    const-string v1, "showDisableItemDialog"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/launcher3/i0;

    .line 13
    .line 14
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/i0;-><init>(Lcom/android/launcher3/l0;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {v1, p0}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lcom/android/launcher3/j0;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/android/launcher3/j0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v1, Lx1/e;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    const p1, 0x7f14008e

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p1}, Lx1/e;->n(I)Lx1/e;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const v1, 0x7f140190

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Lx1/e;->d(I)Lx1/e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const v1, 0x104000a

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1, v0}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const/high16 v0, 0x1040000

    .line 58
    .line 59
    invoke-virtual {p1, v0, p0}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-virtual {p0, p1}, Lx1/e;->b(Z)Lx1/e;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 69
    .line 70
    .line 71
    return-void
.end method
