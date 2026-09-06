.class Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;
.super Ljava/lang/Object;
.source "QuickstepOnboardingPrefs.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/QuickstepOnboardingPrefs;->setup(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStateTransitionComplete(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 2
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_0

    .line 3
    sget-object p1, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    iget-object v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/H1$a;->d(Landroid/content/Context;)Z

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    move-result-object p1

    const-class v0, Lcom/android/launcher3/appprediction/AppsDividerView;

    .line 5
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/appprediction/AppsDividerView;

    sget-object v0, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    iget-object p0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->setShowAllAppsLabel(Z)V

    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$4;->onStateTransitionComplete(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/d$g;->onStateTransitionStart(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
