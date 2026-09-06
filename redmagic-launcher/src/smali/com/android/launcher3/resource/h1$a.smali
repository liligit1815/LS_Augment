.class Lcom/android/launcher3/resource/h1$a;
.super Landroid/database/ContentObserver;
.source "ThirdHiddenAppsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/h1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/resource/h1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/resource/h1;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/h1$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/h1$a;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/resource/h1$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/h1$a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/h1;->H0()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/resource/h1;->K()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->H(Lcom/android/launcher3/resource/h1;)Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/16 v1, 0x9

    .line 23
    .line 24
    new-array v1, v1, [I

    .line 25
    .line 26
    invoke-static {v0, v1}, Lx1/Y;->l(Landroid/content/Context;[I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1}, Lcom/android/launcher3/resource/h1;->I(Lcom/android/launcher3/resource/h1;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/resource/h1;->J0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/h1;->H0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/resource/h1;->J0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onChange isLauncherDelete: "

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->G(Lcom/android/launcher3/resource/h1;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, " ,isSingleMode: "

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "ThirdHiddenAppsManager"

    .line 44
    .line 45
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/android/launcher3/resource/h1;->H(Lcom/android/launcher3/resource/h1;)Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Lcom/android/launcher3/resource/f1;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Lcom/android/launcher3/resource/f1;-><init>(Lcom/android/launcher3/resource/h1$a;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/resource/h1;->K0(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/resource/h1$a;->a:Lcom/android/launcher3/resource/h1;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/android/launcher3/resource/h1;->H(Lcom/android/launcher3/resource/h1;)Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Lcom/android/launcher3/resource/g1;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Lcom/android/launcher3/resource/g1;-><init>(Lcom/android/launcher3/resource/h1$a;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/resource/h1;->K0(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
