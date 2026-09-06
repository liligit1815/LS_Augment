.class public Lcom/android/launcher3/settings/ChooseLockHelperExt;
.super LK1/p;
.source "ChooseLockHelperExt.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/settings/ChooseLockHelperExt$LauncherSettingsFragment;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/p;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p0(Lcom/android/launcher3/settings/ChooseLockHelperExt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/ChooseLockHelperExt;->q0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic q0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->m2()Lcom/android/launcher3/resource/r0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/r0;->q()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x10000

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const/high16 v1, 0x40000

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/high16 v1, 0x20000

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/high16 v1, 0x60000

    .line 26
    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    const-string p0, "ChooseLockHelperExt"

    .line 30
    .line 31
    const-string v0, "retry"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .line 1
    const-string v0, "ChooseLockHelperExt"

    .line 2
    .line 3
    const-string v1, "onBackPressed:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, LW3/b;->onBackPressed()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, LK1/p;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7f140226

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Lcom/android/launcher3/settings/ChooseLockHelperExt$LauncherSettingsFragment;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/android/launcher3/settings/ChooseLockHelperExt$LauncherSettingsFragment;-><init>()V

    .line 14
    .line 15
    .line 16
    const v1, 0x7f0e0118

    .line 17
    .line 18
    .line 19
    invoke-super {p0, p1, v1, v0}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, LW3/b;->onDestroy()V

    .line 2
    .line 3
    .line 4
    const-string p0, "ChooseLockHelperExt"

    .line 5
    .line 6
    const-string v0, "onDestroy"

    .line 7
    .line 8
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, LK1/p;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, LW3/b;->onResume()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    new-instance v1, LK1/a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, LK1/a;-><init>(Lcom/android/launcher3/settings/ChooseLockHelperExt;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
