.class Lcom/android/launcher3/resource/h1$g;
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
    iput-object p1, p0, Lcom/android/launcher3/resource/h1$g;->a:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/h1$g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/h1$g;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/h1$g;->a:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/resource/h1;->J(Lcom/android/launcher3/resource/h1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

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
    const-string v0, "onChange, Space change! isNewPrivateSpaceOpen: "

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$g;->a:Lcom/android/launcher3/resource/h1;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->H(Lcom/android/launcher3/resource/h1;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "ThirdHiddenAppsManager"

    .line 32
    .line 33
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/resource/h1$g;->a:Lcom/android/launcher3/resource/h1;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/resource/h1;->H(Lcom/android/launcher3/resource/h1;)Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    sget-object p1, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    .line 49
    .line 50
    new-instance v0, Lcom/android/launcher3/resource/j1;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/j1;-><init>(Lcom/android/launcher3/resource/h1$g;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
