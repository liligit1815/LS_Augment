.class Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;
.super Ljava/lang/Object;
.source "SettingsActivityMFV.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->Y(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ILcom/android/launcher3/settings/SettingsActivityMFV$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Lcom/android/launcher3/settings/SettingsActivityMFV$a;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/android/launcher3/settings/SettingsActivityMFV$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;->g:Landroid/view/View;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;->h:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;->g:Landroid/view/View;

    .line 2
    .line 3
    const p2, 0x7f0b0211

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/CheckBox;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;->h:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, p1}, Lcom/android/launcher3/settings/SettingsActivityMFV$a;->b(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
