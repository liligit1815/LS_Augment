.class public interface abstract Lcom/android/launcher3/views/H;
.super Ljava/lang/Object;
.source "FloatingIconViewCompanion.java"


# direct methods
.method public static a(Landroid/view/View;Z)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/views/H;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/views/H;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/android/launcher3/views/H;->setIconVisible(Z)V

    .line 8
    .line 9
    .line 10
    xor-int/lit8 v0, p1, 0x1

    .line 11
    .line 12
    invoke-interface {p0, v0}, Lcom/android/launcher3/views/H;->setForceHideDot(Z)V

    .line 13
    .line 14
    .line 15
    xor-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    invoke-interface {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p1, 0x4

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public abstract setForceHideDot(Z)V
.end method

.method public setForceHideRing(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract setIconVisible(Z)V
.end method
