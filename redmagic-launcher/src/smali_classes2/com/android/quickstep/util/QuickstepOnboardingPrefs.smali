.class public Lcom/android/quickstep/util/QuickstepOnboardingPrefs;
.super Ljava/lang/Object;
.source "QuickstepOnboardingPrefs.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setup(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/launcher3/util/H1;->f:Lcom/android/launcher3/X;

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Lcom/android/launcher3/X;->g(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    new-instance v1, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/statemanager/d;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    sget-object v1, Lcom/android/launcher3/util/H1;->d:Lcom/android/launcher3/util/H1$a;

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    new-instance v1, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;

    .line 42
    .line 43
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/statemanager/d;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 54
    .line 55
    if-ne v1, v2, :cond_2

    .line 56
    .line 57
    new-instance v1, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method
