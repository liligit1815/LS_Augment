.class Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;
.super Ljava/lang/Object;
.source "SettingsActivityMFV.java"

# interfaces
.implements Lcom/android/launcher3/settings/SettingsActivityMFV$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->L(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Landroidx/preference/SwitchPreference;

.field final synthetic c:Landroidx/preference/SwitchPreference;

.field final synthetic d:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ZLandroidx/preference/SwitchPreference;Landroidx/preference/SwitchPreference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->d:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->b:Landroidx/preference/SwitchPreference;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->c:Landroidx/preference/SwitchPreference;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->b:Landroidx/preference/SwitchPreference;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->c:Landroidx/preference/SwitchPreference;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->c:Landroidx/preference/SwitchPreference;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->d:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->c:Landroidx/preference/SwitchPreference;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->K(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->b:Landroidx/preference/SwitchPreference;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->d:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->b:Landroidx/preference/SwitchPreference;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->K(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    :goto_0
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->d:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-boolean p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->a:Z

    .line 48
    .line 49
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->J(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Landroid/content/Context;Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->b:Landroidx/preference/SwitchPreference;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->c:Landroidx/preference/SwitchPreference;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;->a()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
