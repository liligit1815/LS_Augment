.class public Lcom/android/launcher3/allapps/LauncherAllAppsContainerView;
.super Lcom/android/launcher3/allapps/r;
.source "LauncherAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/allapps/r<",
        "Lcom/android/launcher3/C2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/LauncherAllAppsContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {}, Lx1/O;->k1()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/LauncherAllAppsContainerView;->setVisibility(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected J(Landroid/view/WindowInsets;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public V()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->P(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getFloatingSearchBarRestingMarginBottom()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/allapps/r;->getFloatingSearchBarRestingMarginBottom()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/android/launcher3/V3;

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Lcom/android/launcher3/V3;->i(Lcom/android/launcher3/C2;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->E()Lcom/android/launcher3/statemanager/a;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->E()Lcom/android/launcher3/statemanager/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/android/launcher3/V3;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->i(Lcom/android/launcher3/C2;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-gez p0, :cond_2

    .line 53
    .line 54
    return p0

    .line 55
    :cond_1
    const/4 p0, -0x1

    .line 56
    :cond_2
    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method

.method public getFloatingSearchBarRestingMarginEnd()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/allapps/r;->getFloatingSearchBarRestingMarginEnd()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 13
    .line 14
    check-cast v0, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 25
    .line 26
    if-ne v1, v2, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 29
    .line 30
    check-cast v1, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->H0:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 41
    .line 42
    check-cast p0, Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v2, p0}, Lcom/android/launcher3/V3;->j(Lcom/android/launcher3/C2;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->E()Lcom/android/launcher3/statemanager/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->E()Lcom/android/launcher3/statemanager/a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/android/launcher3/V3;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 68
    .line 69
    check-cast p0, Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->j(Lcom/android/launcher3/C2;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    return p0

    .line 76
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/android/launcher3/V3;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 83
    .line 84
    check-cast p0, Lcom/android/launcher3/C2;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->j(Lcom/android/launcher3/C2;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method public getFloatingSearchBarRestingMarginStart()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/allapps/r;->getFloatingSearchBarRestingMarginStart()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 13
    .line 14
    check-cast v0, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 25
    .line 26
    if-ne v1, v2, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 29
    .line 30
    check-cast v1, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->H0:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 41
    .line 42
    check-cast p0, Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v2, p0}, Lcom/android/launcher3/V3;->k(Lcom/android/launcher3/C2;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->E()Lcom/android/launcher3/statemanager/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->E()Lcom/android/launcher3/statemanager/a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/android/launcher3/V3;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 68
    .line 69
    check-cast p0, Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->k(Lcom/android/launcher3/C2;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    return p0

    .line 76
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/android/launcher3/V3;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 83
    .line 84
    check-cast p0, Lcom/android/launcher3/C2;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->k(Lcom/android/launcher3/C2;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    if-ne p1, v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x4

    .line 26
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
