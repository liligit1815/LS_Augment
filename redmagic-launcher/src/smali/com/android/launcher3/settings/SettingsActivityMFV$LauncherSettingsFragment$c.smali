.class Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$c;
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
.field final synthetic g:Lcom/android/launcher3/settings/SettingsActivityMFV$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/SettingsActivityMFV$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$c;->g:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$c;->g:Lcom/android/launcher3/settings/SettingsActivityMFV$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$a;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
