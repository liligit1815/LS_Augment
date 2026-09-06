.class Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;
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
.field mFromAllApps:Z

.field final synthetic val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field final synthetic val$stateManager:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/statemanager/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->mFromAllApps:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onStateTransitionComplete(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->v5()Lcom/android/launcher3/hybridhotseat/b;

    move-result-object v0

    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->mFromAllApps:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-ne p1, v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/launcher3/hybridhotseat/b;->u()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 4
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p1

    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/launcher3/util/H1;->d:Lcom/android/launcher3/util/H1$a;

    iget-object v1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/H1$a;->d(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/hybridhotseat/b;->N()V

    .line 7
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->onStateTransitionComplete(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public onStateTransitionStart(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 2
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    move-result-object p1

    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->mFromAllApps:Z

    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$2;->onStateTransitionStart(Lcom/android/launcher3/V3;)V

    return-void
.end method
