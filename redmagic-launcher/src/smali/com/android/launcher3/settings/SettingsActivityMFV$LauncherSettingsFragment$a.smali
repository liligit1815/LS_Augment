.class Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;
.super Ljava/lang/Object;
.source "SettingsActivityMFV.java"

# interfaces
.implements Lx1/h$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->f(Landroidx/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroidx/preference/Preference;

.field final synthetic b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Landroidx/preference/Preference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->a:Landroidx/preference/Preference;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 8
    .line 9
    const v1, 0x7f14008b

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->i(Z)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Landroid/content/Intent;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->a:Landroidx/preference/Preference;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-class v2, Lcom/android/launcher3/settings/SubscriptActivity;

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 26
    .line 27
    .line 28
    const-string v1, "isFromSettings"

    .line 29
    .line 30
    invoke-static {}, Lcom/android/launcher3/settings/SettingsActivityMFV;->q0()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const v2, 0xa245

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0, v2}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;->b:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 56
    .line 57
    const v1, 0x7f14008c

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 70
    .line 71
    .line 72
    return-void
.end method
