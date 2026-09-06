.class Lcom/android/launcher3/C2$g;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->l2()Landroid/window/OnBackAnimationCallback;
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
    iput-object p1, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onBackCancelled()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->K3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onBackInvoked()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->a4()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/C2;->O0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/C2;->O0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/android/launcher3/V2;->b()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-string p0, "Launcher"

    .line 27
    .line 28
    const-string v0, "onBackInvoked: Interruption in mLauncherCallbacks handleBackPressed"

    .line 29
    .line 30
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    const-string v0, "onBackInvoked"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->b4(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onBackProgressed(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->R0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/V3;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/window/BackEvent;->getProgress()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/V3;->F(Lcom/android/launcher3/C2;F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onBackStarted(Landroid/window/BackEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/C2$g;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->L3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
