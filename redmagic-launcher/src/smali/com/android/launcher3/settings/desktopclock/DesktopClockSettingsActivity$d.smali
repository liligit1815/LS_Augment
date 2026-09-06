.class Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;
.super Ljava/lang/Object;
.source "DesktopClockSettingsActivity.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;->g:Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;->g:Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->c(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)Landroid/widget/LinearLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;->g:Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->c(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)Landroid/widget/LinearLayout;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;->g:Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->c(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)Landroid/widget/LinearLayout;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
