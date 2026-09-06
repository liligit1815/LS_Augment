.class public Lcom/android/launcher3/allapps/SecondaryLauncherAllAppsContainerView;
.super Lcom/android/launcher3/allapps/r;
.source "SecondaryLauncherAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/allapps/r<",
        "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/SecondaryLauncherAllAppsContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected D0(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
