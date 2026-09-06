.class Lcom/android/launcher3/C2$m;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Lcom/android/launcher3/util/h2$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/C2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherIconAnimation:onReceive onScreenOnChanged isOn = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Launcher"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/android/launcher3/C2;->u4(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    iput-boolean p1, p0, Lcom/android/launcher3/C2;->A0:Z

    .line 31
    .line 32
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    const-string v0, "Launcher"

    .line 2
    .line 3
    const-string v1, "launcherIconAnimation:onReceive ZteScreenOff"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->U4()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/android/launcher3/C2;->A0:Z

    .line 17
    .line 18
    return-void
.end method

.method public onWallpaperChanged()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherOneShot:onReceive onWallpaperChanged mWallpaperManager="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/C2;->H0:Landroid/app/WallpaperManager;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "Launcher"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/android/launcher3/C2;->H0:Landroid/app/WallpaperManager;

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/android/launcher3/C2;->H0:Landroid/app/WallpaperManager;

    .line 42
    .line 43
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/C2$m;->a:Lcom/android/launcher3/C2;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/C2;->H0:Landroid/app/WallpaperManager;

    .line 46
    .line 47
    invoke-static {p0}, Lx1/O;->t5(Landroid/app/WallpaperManager;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
