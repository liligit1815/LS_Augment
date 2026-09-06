.class Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;
.super Ljava/lang/Object;
.source "SettingsActivityMFV.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->Y(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ILcom/android/launcher3/settings/SettingsActivityMFV$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

.field final synthetic h:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/SettingsActivityMFV$a;Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;->g:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;->h:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;->g:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/android/launcher3/settings/SettingsActivityMFV$a;->onDismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;->h:Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 12
    .line 13
    return-void
.end method
