.class public Lf2/i;
.super Lf2/d;
.source "SplitScreenSelectState.java"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lf2/d;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/16 p0, 0x362

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    const/16 p0, 0x205

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    const/16 p0, 0x1f4

    .line 20
    .line 21
    return p0
.end method

.method public q(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectTranslation()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public shouldPreserveDataStateOnReapply()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/16 p0, 0x40

    .line 2
    .line 3
    return p0
.end method
