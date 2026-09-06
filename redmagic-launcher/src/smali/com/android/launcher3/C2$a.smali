.class Lcom/android/launcher3/C2$a;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->Y3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/C2$a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/C2$a;->g:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/C2;->j:Lcom/android/launcher3/Workspace;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->y1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/C2$a;->g:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    instance-of v1, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->F3()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string v0, "Launcher"

    .line 32
    .line 33
    const-string v1, "onResumeForMFV isCurInMiBoard doWallpaperBlurForMiBoard"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/C2$a;->g:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, 0x1

    .line 47
    const/4 v1, 0x0

    .line 48
    const/high16 v2, 0x3f800000    # 1.0f

    .line 49
    .line 50
    invoke-virtual {p0, v2, v0, v1}, LP1/h;->v(FZZ)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method
