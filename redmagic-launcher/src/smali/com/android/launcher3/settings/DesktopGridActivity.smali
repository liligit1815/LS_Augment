.class public Lcom/android/launcher3/settings/DesktopGridActivity;
.super LK1/p;
.source "DesktopGridActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;
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


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, LK1/p;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7f14037a

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;-><init>()V

    .line 14
    .line 15
    .line 16
    const v1, 0x7f0e0201

    .line 17
    .line 18
    .line 19
    invoke-super {p0, p1, v1, v0}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
